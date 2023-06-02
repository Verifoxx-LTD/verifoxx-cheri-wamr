import argparse
import subprocess
import sys
import os
import json
import uuid
import stat

from fabric import Connection
from pathlib import (Path, PurePosixPath)
from invoke.vendor import six


JSON_KEYS = ['hostname',    # Remote host to connect to
             'user',        # Username to login with
             'key',         # Key for SSH connection
             'dest',        # temp working folder on destination 
             'wamr'         # Full pathname of iwasm to execute
             ]

def do_test():
    # Get the location of JSON file which provides arguments for the remote machine
    json_file = os.getenv("WAMR_CHERI_ADAPTER_JSON")
    if not json_file:
        print('Need to provide JSON file in WAMR_CHERI_ADAPTER_JSON env var', file=sys.stderr)
        sys.exit(-1)
    
    with open(json_file, 'r') as f:
        json_dict = json.load(f)
        
    if not all(json_key in json_dict for json_key in JSON_KEYS):
        print(f'JSON file {json_file} missing required settings', file=sys.stderr)
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
    
    with Connection(host=json_dict['hostname'],
                    user=json_dict['user'],
                    connect_kwargs={'key_filename': os.path.expanduser(json_dict['key'])},
                    ) as c:
    
        r = c.run(f'mkdir -p {dest_folder}')
        if 0 != r.exited:
            sys.exit(r.exited)

        try:
        
            if args.version:
                sys.exit(run_iwasm(c, json_dict['wamr'], dest_folder, ['--version']))

            # Copy files to remote host: Copy any directories (in full) which are identified - we will copy them back when done
            for fol in args.dir:
                # Copy each folder to the destination
                put_folder(c, Path.cwd().joinpath(fol), dest_folder.joinpath(fol))
            
            # Copy the WASM file and any other needed files
            
            wasm_dest_file = dest_folder.joinpath(Path(args.test_file).relative_to(Path.cwd()))
            fol_search = Path(args.test_file).parent
            files_match_pattern = f'{Path(args.test_file).stem}.*'
            
            for entry in fol_search.glob(files_match_pattern):
                dest_file = dest_folder.joinpath(Path(entry).relative_to(Path.cwd()))
                c.put(entry, str(dest_file))
            
            # Prepare arguments (same format as WAMR adapter)
            TEST_FILE = wasm_dest_file

            # Handle whitespace in prog args and env args            
            PROG_ARGS = [f"'{cmd}'" if len(cmd.split()) > 1 else cmd for cmd in args.arg]
            ENV_ARGS = [f"--env='{cmd}'" if len(cmd.split()) > 1 else f"--env={cmd}" for cmd in args.env]
            
            DIR_ARGS = [f"--dir={i}" for i in args.dir]
            
            # Run wamr in the dest folder location
            sys.exit(run_iwasm(c, json_dict['wamr'], dest_folder, ENV_ARGS + DIR_ARGS + [TEST_FILE] + PROG_ARGS))
             
        finally:
            # Copy back the directories we sent
            for fol in args.dir:
                get_folder(c, dest_folder.joinpath(fol), Path.cwd().joinpath(fol))
                
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

    
if __name__ == '__main__':
    do_test()

