import argparse
import subprocess
import sys
import os
import json
import uuid
import stat
import tempfile

from fabric import Connection
from pathlib import (Path, PurePosixPath)
from invoke.vendor import six

SSH_DEFAULT_PORT = 22

# JSON keys
REQUIRED_JSON_KEYS = ['hostname',    # Remote host to connect to
             'user',        # Username to login with
             'key',         # Key for SSH connection
             'dest',        # temp working folder on destination 
             'wamr',         # Full pathname of iwasm to execute
             'wamrc',       # Full pathname of wamrc to execute
             ]

OPTIONAL_JSON_KEYS = [
             'wamrc_args',      # Target args to use for wamrc (as JSON list)
             'wamrc_host',      # Optional remote host if wamrc not run locally
             'allowres',   # String passed in allow-resolve argument
             'addrpool'    # String passed in addr-pool argument
             ]

WAMRC_HOST_JSON_KEYS = [
             'hostname',     # Remote host for WAMRC (format <ip>:<port>, port default to 22)
             'user',        # Username to log in with
             'key',         # Key for SSH connection
             'dest',        # Temp working folder on destination
             ]

def make_aot_file(wamrc_prog, cmd_args, wasm_file, wamrc_host_dict=None):
    """ Use WAMRc to generate the AOT file, optionally logging in to remote host.
        Return generated AOT file on success else None.
    """
    # Allocate a temp filename for the AOT file output
    aot_file = wasm_file.with_suffix('.aot').name
    temp_path = Path(tempfile.gettempdir())
    
    retval = aot_file_on_remote(wamrc_host_dict, wamrc_prog, temp_path, wasm_file, aot_file, cmd_args) if wamrc_host_dict \
                    else aot_file_on_local(wamrc_prog, temp_path, wasm_file, aot_file, cmd_args)
    
    if retval == 0:
        return temp_path / aot_file
    else:
        sys.exit(retval)
    
def aot_file_on_local(wamrc_prog, local_temp_path, wasm_file, aot_file, wamrc_args):

    # Finish the command line args with the output AOT file and input WASM (both in the cwd)
    wamrc_args.append(f'-o {aot_file}')
    wamrc_args.append(wasm_file)
    
    return run_wamrc_local(wamrc_prog, local_temp_path, wamrc_args) 


def aot_file_on_remote(wamrc_host_dict, wamrc_prog, local_temp_path, wasm_file, aot_file, wamrc_args):
    
    # Generate a random folder in the dest area on remote machine
    dest_folder = PurePosixPath(wamrc_host_dict['dest']).joinpath(uuid.uuid4().hex)

    # Finish the command line args with the output AOT file and input WASM (both in the cwd)
    wamrc_args.append(f'-o {aot_file}')
    wamrc_args.append(wasm_file.name)

    # split provided hostname:port into component parts
    host, port = get_host_port(wamrc_host_dict['hostname'])
            
    with Connection(host=host,
                    port=port,
                    user=wamrc_host_dict['user'],
                    connect_kwargs={'key_filename': os.path.expanduser(wamrc_host_dict['key'])},
                    ) as c:

        r = c.run(f'mkdir -p {dest_folder}')
        if 0 != r.exited:
            sys.exit(r.exited)

        try:
            # Copy the WASM file (absolute path) for AOT convertsion
            put_file(c, wasm_file, dest_folder)
            
            # Run wamrc on the remote machine and return program result code
            return run_wamrc_remote(c, wamrc_prog, dest_folder, wamrc_args)
             
        finally:
            # Copy back the generated AOT file
            get_file(c, dest_folder / aot_file, local_temp_path)
                
            # Remove the entire temporary folder on remote machine
            c.run(f'rm -rf {dest_folder}')

def do_aot_test():
    # Get the location of JSON file which provides arguments for the remote machine
    json_file = os.getenv("WAMR_CHERI_ADAPTER_JSON")
    if not json_file:
        print('Need to provide JSON file in WAMR_CHERI_ADAPTER_JSON env var', file=sys.stderr)
        sys.exit(-1)
    
    with open(json_file, 'r') as f:
        json_dict = json.load(f)
        
    if not all(json_key in json_dict for json_key in REQUIRED_JSON_KEYS):
        print(f'JSON file {json_file} missing required settings', file=sys.stderr)
        sys.exit(-1)
    
    # Check no rogue args
    if set(json_dict.keys()) - set(REQUIRED_JSON_KEYS) - set(OPTIONAL_JSON_KEYS):
        print(f'JSON file {json_file} contains unknown settings', file=sys.stderr)
        sys.exit(-1)
        
    # Get optional JSON arguments
    wamrc_target_args_list = json_dict.get('wamrc_args', list())
    
    wamrc_host = json_dict.get('wamrc_host')
    
    if wamrc_host and not all(dict_key in wamrc_host for dict_key in WAMRC_HOST_JSON_KEYS):
        print(f'JSON file {json_file} specifying wamrc remote host missing remote login settings')
        sys.exit(-1)
        
    # Parse args
    parser = argparse.ArgumentParser()
    parser.add_argument("--version", action="store_true")
    parser.add_argument("--test-file", action="store")
    parser.add_argument("--arg", action="append", default=[])
    parser.add_argument("--env", action="append", default=[])
    parser.add_argument("--dir", action="append", default=[])
    
    args = parser.parse_args()

    # Generate a random folder in the dest area
    dest_folder = PurePosixPath(json_dict['dest']).joinpath(uuid.uuid4().hex)

    # split provided hostname:port into component parts
    host, port = get_host_port(json_dict['hostname'])

    with Connection(host=host,
                    port=port,
                    user=json_dict['user'],
                    connect_kwargs={'key_filename': os.path.expanduser(json_dict['key'])},
                    ) as c:
    
        r = c.run(f'mkdir -p {dest_folder}')
        if 0 != r.exited:
            sys.exit(r.exited)

        aot_file = None
        try:
                    
            if args.version:
                sys.exit(run_iwasm(c, json_dict['wamr'], dest_folder, ['--version']))

            # Copy files to remote host: Copy any directories (in full) which are identified - we will copy them back when done
            for fol in args.dir:
                # Copy each folder to the destination
                put_folder(c, Path.cwd().joinpath(fol), dest_folder.joinpath(fol))

            # Make AOT file - will exit() if this fails
            # Made file has .aot extension and is absolute path
            aot_file = make_aot_file(json_dict['wamrc'], wamrc_target_args_list, Path(args.test_file), wamrc_host)

            # Copy test files
            fol_search = Path(args.test_file).parent
            files_match_pattern = f'{Path(args.test_file).stem}.*'  # Will also copy the .wasm, but this will be ignored
            
            for entry in fol_search.glob(files_match_pattern):
                dest_file = dest_folder.joinpath(Path(entry).relative_to(Path.cwd()))
                c.put(entry, str(dest_file))

            # Finally, copy the AOT file
            put_file(c, aot_file, dest_folder)
            aot_dest_file = dest_folder.joinpath(aot_file.name)
            
            # Prepare arguments (same format as WAMR adapter)
            TEST_FILE = aot_dest_file

            # Add in optional address args so we can run network access WASMs
            ADDR_ARGS = []
            if 'addrpool' in json_dict:
                ADDR_ARGS.append(f'--addr-pool={json_dict["addrpool"]}')
            if 'allowres' in json_dict:
                ADDR_ARGS.append(f'--allow-resolve={json_dict["allowres"]}')

            # Handle whitespace in prog args and env args            
            PROG_ARGS = [f"'{cmd}'" if len(cmd.split()) > 1 else cmd for cmd in args.arg]
            ENV_ARGS = [f"--env='{cmd}'" if len(cmd.split()) > 1 else f"--env={cmd}" for cmd in args.env]
            
            DIR_ARGS = [f"--dir={i}" for i in args.dir]
            
            # Run wamr in the dest folder location
            sys.exit(run_iwasm(c, json_dict['wamr'], dest_folder, ENV_ARGS + DIR_ARGS + ADDR_ARGS + [TEST_FILE] + PROG_ARGS))
             
        finally:
            # Copy back the directories we sent
            for fol in args.dir:
                get_folder(c, dest_folder.joinpath(fol), Path.cwd().joinpath(fol))
                
            # Delete the AOT file if it exists on the local machine
            if aot_file:
                aot_file.unlink(missing_ok=True)

            # Remove the entire temporary folder
            c.run(f'rm -rf {dest_folder}')

def put_folder(conn, local_folder_pathlib, remote_folder_pathlib):
    """ Transfer everything in given local_folder to remote_folder on remote machine.
        As fabric no longer supports folder transfers, use glob.
        Returns nothing - exception on failure
    """
    conn.run(f'mkdir -p {remote_folder_pathlib}')
    
    for src in local_folder_pathlib.rglob('*'):
        target = remote_folder_pathlib.joinpath(src.relative_to(local_folder_pathlib))
        
        if src.is_file():
            conn.put(str(src), str(target))          # Copy file
        elif src.is_dir():
            conn.run(f'mkdir -p {target}')  # Make folder
        else:
            print(f'Unknown source entry {src} - ignoring', file=sys.stderr)

def put_file(conn, local_file, remote_folder_pathlib):
    """ Transfer single local file to remote folder on remote machine.
        Same filename on remote.
        Returns nothing - exception on failure
    """
    target = remote_folder_pathlib.joinpath(local_file.name)
    conn.put(str(local_file), str(target))          # Copy file
        
def get_file(conn, remote_file, local_folder_pathlib):
    """ Transfer single remote file to folder on local machine.
        Same filename on remote.
        Returns nothing - exception on failure
    """
    target = local_folder_pathlib.joinpath(remote_file.name)
    conn.get(str(remote_file), str(target))          # Copy file

def get_folder(conn, remote_folder_pathlib, local_folder_pathlib):
    """ Transfer everything in given remote_folder to local_folder on local machine.
        As fabric no longer supports folder transfers, use "find" to find entries
        Returns nothing - exception on failure.
    """
    remote_dirs = conn.run(f'find {remote_folder_pathlib} -type d').stdout.split()
    remote_files = conn.run(f'find {remote_folder_pathlib} -type f').stdout.split()
    
    # Make sure local folder writable
    local_folder_pathlib.chmod(stat.S_IWRITE)
    
    for src in remote_dirs:
        target = local_folder_pathlib.joinpath(Path(src).relative_to(remote_folder_pathlib))
        if not target.exists():
            target.mkdir(parents=True, exist_ok=True)   # Create folder on local
            
    for src in remote_files:
        target = local_folder_pathlib.joinpath(Path(src).relative_to(remote_folder_pathlib))
        if target.exists():
            target.chmod(stat.S_IWRITE) # Make sure can write to it
        conn.get(str(src), str(target))

def run_iwasm(conn, iwasm_prog, remote_folder, cmd_args):
    with conn.cd(PurePosixPath(remote_folder)):
        cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
        
        r = conn.run(f'{iwasm_prog}{" " if cmd_string else ""}{cmd_string}', warn=True)
        return r.exited

def run_wamrc_remote(conn, wamrc_prog, remote_folder, cmd_args):
    with conn.cd(PurePosixPath(remote_folder)):
        cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
        
        # Hide WAMRC stdout to avoid confusing test runner
        r = conn.run(f'{wamrc_prog}{" " if cmd_string else ""}{cmd_string}', warn=True, hide='stdout')
        return r.exited

def run_wamrc_local(wamrc_prog, working_folder, cmd_args):
    cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
    
    # Hide WAMRC stdout to avoid confusing test runner
    r = subprocess.run(f'{iwasm_prog}{" " if cmd_string else ""}{cmd_string}', cwd=working_folder, stdout=subprocess.DEVNULL)
    return r.returncode

def get_host_port(hostname_with_port_string):
    try:
        host, port = hostname_with_port_string.split(':')
    except ValueError:
        host = hostname_with_port_string
        port = None # No port supplied

    return host, port

if __name__ == '__main__':
    do_aot_test()
