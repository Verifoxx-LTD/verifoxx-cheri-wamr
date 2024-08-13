import subprocess
import sys
import os
import json
import uuid
import stat
import tempfile

from fabric import Connection

from pathlib import (Path, PurePosixPath)

from enum import Enum

from logging_mixin import LoggingMixin

SSH_DEFAULT_PORT = 22

# JSON keys
REQUIRED_JSON_KEYS = ['hostname',    # Remote host to connect to
             'user',        # Username to login with
             'key',         # Key for SSH connection
             'dest',        # temp working folder on destination 
             'wamr_purecap',        # Full pathname of iwasm to execute, for purecap
             'wamr_hybrid',        # Full pathname of iwasm to execute, for hybrid             
             'wamrc',       # Full pathname of wamrc to execute
             ]

OPTIONAL_JSON_KEYS = [
             'wamrc_args_purecap',      # Target args to use for wamrc for purecap (as JSON list)
             'wamrc_args_hybrid',       # Target args to use for wamrc for hybrid (as JSON list)
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

class TestType(Enum):
    HYBRID = 0
    PURECAP = 1
    

class TestFileType(Enum):
    WASM = 0
    AOT = 1
    NATIVE = 2    

class BmTestRunner(LoggingMixin):
    """ Responsible for running test on remote.  Loads settings from JSON file. """
    
    def __init__(self, json_file, repeat_count=5):
        """ Given: JSON file name to load
                    callback which can parse stdout from an iwasm test and return an integer which is # seconds taken
        """
        super().__init__()
        with open(json_file, 'r') as f:
            json_dict = json.load(f)
        
        if not all(json_key in json_dict for json_key in REQUIRED_JSON_KEYS):
            raise KeyError(f'JSON file {json_file} missing required settings')

        # Check no rogue args
        if set(json_dict.keys()) - set(REQUIRED_JSON_KEYS) - set(OPTIONAL_JSON_KEYS):
            raise KeyError(f'JSON file {json_file} contains unknown settings')
        
        # Get optional JSON arguments
        self._wamrc_purecap_target_args_list = json_dict.get('wamrc_args_purecap', list())
        self._wamrc_hybrid_target_args_list = json_dict.get('wamrc_args_hybrid', list())
                
        self._wamrc_host_dict = json_dict.get('wamrc_host')
        self._allowres = json_dict.get('allowres')
        self._addrpool = json_dict.get('addrpool')
        
        if self._wamrc_host_dict and not all(dict_key in self._wamrc_host_dict for dict_key in WAMRC_HOST_JSON_KEYS):
            raise KeyError(f'JSON file {json_file} specifying wamrc remote host missing remote login settings')

        # Generate a random folder name for the dest area for WAMR
        self._dest_folder = PurePosixPath(json_dict['dest']).joinpath(uuid.uuid4().hex)
        
        # And for WAMRC (if applicable)
        self._wamrc_dest_folder = (PurePosixPath(self._wamrc_host_dict['dest']).joinpath(uuid.uuid4().hex) if self._wamrc_host_dict
                                    else None)

        
        # split provided hostname:port into component parts
        self._host, self._port = self._get_host_port(json_dict['hostname'])
        self._user = json_dict['user']
        self._ssh_keyfile =  os.path.expanduser(json_dict['key'])

        # Everything else we'll use from the JSON dict - already checked all keys found
        self._params_dict = dict((k, json_dict[k]) for k in REQUIRED_JSON_KEYS)
        
        # Save callback reference
        self._callback = None
        
        # Test repeat count
        self._rep_count = repeat_count

    @staticmethod
    def _get_host_port(hostname_with_port_string):
        try:
            host, port = hostname_with_port_string.split(':')
        except ValueError:
            host = hostname_with_port_string
            port = None # No port supplied
    
        return host, port
        
    def set_callback(self, callback_fn):
        self._callback = callback_fn
                                                
    def run_test(self, test_file, test_type, test_file_type, repeat_count=None, expected_exit_code=0):
        """ Run the test on remote.  Repeat the given number of times.
            Returns time taken, or None on error
        """
        result_or_None = None
        
        if not repeat_count:
            repeat_count = self._rep_count 
        
        if not self._callback:
            self._log.error('Callback function must be set before running test!')
            return result_or_None
                
        with Connection(host=self._host,
                    port=self._port,
                    user=self._user,
                    connect_kwargs={'key_filename': self._ssh_keyfile},
                    ) as c:
            r = c.run(f'mkdir -p {self._dest_folder}')
            if 0 != r.exited:
                self._log.error(f'Failed to create folder on remote: command return error {r.exited}')
                return result_or_None
    
            dest_test_file = None
            aot_file = None
            try:
                # Make AOT file if we are doing aot
                # Made file has .aot extension and is absolute path
                if test_file_type == TestFileType.AOT:
                    aot_file = self._make_aot_file(
                                             (self._wamrc_purecap_target_args_list if test_type == TestType.PURECAP
                                                else self._wamrc_hybrid_target_args_list),
                                             Path(test_file)
                                             )

                    if aot_file is None:
                        return result_or_None
                    
                    # Copy the AOT file
                    self._put_file(c, aot_file, self._dest_folder)
                    dest_test_file = self._dest_folder.joinpath(aot_file.name)
                    
                elif test_file_type == TestFileType.NATIVE:
                    # Copy the native file
                    self._put_file(c, test_file, self._dest_folder)
                    dest_test_file = self._dest_folder.joinpath(Path(test_file).name)
                    # Chmod the native file to add executable permissions
                    r = c.run(f'chmod o+x {dest_test_file}')
                    if 0 != r.exited:
                        self._log.error(f'Failed to chmod executable file {dest_test_file} on remote')
                        return result_or_None
            
                else:
                    self._put_file(c, test_file, self._dest_folder)
                    dest_test_file = self._dest_folder.joinpath(Path(test_file).name)
                    
            
                # Add in optional address args so we can run network access WASMs
                addr_args = []
                if self._addrpool:
                    addr_args.append(f'--addr-pool={self._addrpool}')
                if self._allowres:
                    addr_args.append(f'--allow-resolve={self._allowres}')

            
                # Run WAMR (iwasm) in the dest folder location.  Same step for AOT or WASM
                # This function should return the time taken, or None for error
                
                result_sum = 0.0
                
                for i in range(1, 1+repeat_count):
                    self._log.info(f'Running {test_file_type}:{test_type}, Iteration {i} of {repeat_count}...')
                    
                    if test_file_type == TestFileType.NATIVE:
                        result = self._run_native(c, dest_test_file, expected_exit_code)
                    else:
                        result = self._run_iwasm(c, test_type, addr_args + [dest_test_file], expected_exit_code)
                    
                    if result is None:
                        self._log.error('Remote execution failed!')
                        return None
                
                    result_sum += result
                    self._log.info(f'Run successful, test took {result}s')
                    
                return result_sum / repeat_count
             
            finally:
                # Delete the AOT file if it exists on the local machine
                if aot_file:
                    aot_file.unlink(missing_ok=True)

                # Remove the entire temporary folder on remote
                c.run(f'rm -rf {self._dest_folder}')


    def _make_aot_file(self, cmd_args, wasm_file):
        """ Use WAMRc to generate the AOT file, optionally logging in to remote host.
            Return generated AOT file on success else None.
        """
        # Get the AOT filename based on WASM file + random element
        aot_file = '{}_{}'.format(uuid.uuid4().hex, wasm_file.with_suffix('.aot').name)

        # File to be put in temporary folder        
        temp_path = Path(tempfile.gettempdir())
        
        retval = self._aot_file_on_remote(temp_path, wasm_file, aot_file, cmd_args) if self._wamrc_host_dict \
                        else self._aot_file_on_local(temp_path, wasm_file, aot_file, cmd_args)
        
        if retval == 0: 
            return temp_path / aot_file
        
        # else...
        self._log.error('WAMRC command failed: exit value = {retval}')
        return None
    
    def _aot_file_on_local(self, local_temp_path, wasm_file, aot_file, wamrc_args):
    
        # Finish the command line args with the output AOT file and input WASM (both in the cwd)
        wamrc_args.append(f'-o {aot_file}')
        wamrc_args.append(wasm_file)
        
        return self._run_wamrc_local(local_temp_path, wamrc_args) 


    def _aot_file_on_remote(self, local_temp_path, wasm_file, aot_file, wamrc_args):
    
        # split provided hostname:port into component parts
        host, port = self._get_host_port(self._wamrc_host_dict['hostname'])
                
        with Connection(host=host,
                        port=port,
                        user=self._wamrc_host_dict['user'],
                        connect_kwargs={'key_filename': os.path.expanduser(self._wamrc_host_dict['key'])},
                        ) as c:
    
            r = c.run(f'mkdir -p {self._wamrc_dest_folder}')
            if 0 != r.exited:
                self._log.error(f'Failed to create WAMRC temp folder on WAMRC remote: command return error {r.exited}')
                return None
    
            try:
                # Copy the WASM file (absolute path) for AOT convertsion
                self._put_file(c, wasm_file, self._wamrc_dest_folder)
                
                # Run wamrc on the remote machine and return program result code
                return self._run_wamrc_remote(c, self._wamrc_dest_folder, wamrc_args + [f'-o {aot_file}', wasm_file.name])
                 
            finally:
                # Copy back the generated AOT file
                self._get_file(c, self._wamrc_dest_folder / aot_file, local_temp_path)
                    
                # Remove the entire temporary folder on remote machine
                c.run(f'rm -rf {self._wamrc_dest_folder}')


    def _put_folder(self, conn, local_folder_pathlib, remote_folder_pathlib):
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
                self._log.debug(f'Unknown source entry {src} - ignoring')

    def _put_file(self, conn, local_file, remote_folder_pathlib):
        """ Transfer single local file to remote folder on remote machine.
            Same filename on remote.
            Returns nothing - exception on failure
        """
        target = remote_folder_pathlib.joinpath(local_file.name)
        conn.put(str(local_file), str(target))          # Copy file
        
    def _get_file(self, conn, remote_file, local_folder_pathlib):
        """ Transfer single remote file to folder on local machine.
            Same filename on remote.
            Returns nothing - exception on failure
        """
        target = local_folder_pathlib.joinpath(remote_file.name)
        conn.get(str(remote_file), str(target))          # Copy file

    def _get_folder(self, conn, remote_folder_pathlib, local_folder_pathlib):
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

    def _run_iwasm(self, conn, test_type, cmd_args, expected_exit_code):
        """ Run a single iteration of WAMR and parse stdout for the time taken (s). """
        with conn.cd(PurePosixPath(self._dest_folder)):
            cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
        
            iwasm_prog = self._params_dict['wamr_purecap'] if test_type == TestType.PURECAP else self._params_dict['wamr_hybrid']
        
            r = conn.run(f'{iwasm_prog}{" " if cmd_string else ""}{cmd_string}', warn=True)
            
            # Check return code != 0 is an error
            if r.exited != expected_exit_code:
                self._log.error(f'Remote WAMR failed: returned {r.exited}')
                return None
            
            # Analyse the stdout with the callback function to recover time (or None)
            return self._callback(r.stdout)

    def _run_native(self, conn, native_prog_to_run, expected_exit_code):
        """ Run the native program and parse stdout for the time taken (s). """
        with conn.cd(PurePosixPath(self._dest_folder)):
            r = conn.run(f'{native_prog_to_run}', warn=True)
            
            # Check return code != 0 is an error
            if r.exited != expected_exit_code:
                self._log.error(f'Remote WAMR failed: returned {r.exited}')
                return None
            
            # Analyse the stdout with the callback function to recover time (or None)
            return self._callback(r.stdout)

    def _run_wamrc_remote(self, conn, remote_folder, cmd_args):
        wamrc_prog = self._params_dict['wamrc']
        with conn.cd(PurePosixPath(remote_folder)):
            cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
            
            # Hide WAMRC stdout to avoid confusing test runner
            self._log.debug(f'Running command: {wamrc_prog}{" " if cmd_string else ""}{cmd_string}')
            r = conn.run(f'{wamrc_prog}{" " if cmd_string else ""}{cmd_string}', warn=True, hide='stdout')
            return r.exited
    
    def _run_wamrc_local(self, working_folder, cmd_args):
        wamrc_prog = self._params_dict['wamrc']
        cmd_string = ' '.join(str(cmd) for cmd in cmd_args)
        
        # Hide WAMRC stdout to avoid confusing test runner
        r = subprocess.run(f'{wamrc_prog}{" " if cmd_string else ""}{cmd_string}', cwd=working_folder, stdout=subprocess.DEVNULL)
        return r.returncode

