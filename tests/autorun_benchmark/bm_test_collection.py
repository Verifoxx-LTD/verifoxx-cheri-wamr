"""
Copyright (C) 2024 Verifoxx Limited
"""
# Manages a list of BmTest derived objects for each type of test

from pathlib import Path
from bm_test import BmTest
from logging_mixin import LoggingMixin

WASM_FILTER = '{}*.wasm'

class BmTestCollection(LoggingMixin):
    """ Holds a collection of BmTest objects created according to a pattern. """
    def __init__(self, collection_name, test_prefix, test_folder, _cls, test_runner, do_aot=True, do_native=True):
        """ Given: name for this collection, prefix of test to find, folder containing WASM files.
            _cls must be a BmTest derived class object, which is the type of list to initialize
        """
        super().__init__()
        if not issubclass(_cls, BmTest):
            raise TypeError(f'Passed in class {_cls.name} must be derived from BmTest!')
        
        self._collection_name = collection_name
        
        test_folder_path = Path(test_folder)
        
        test_files = test_folder_path.glob(WASM_FILTER.format(test_prefix))
        
        self._tests_dict = {f.stem: _cls(f.stem, f, test_runner) for f in test_files}
        self._test_results = None
        self._do_aot = do_aot
        self._do_native = do_native
        
    def run(self):
        """ Run each of the tests and gather results. Return true on success, false on failiure """
        self._test_results = dict()
        for test_name, test in self._tests_dict.items():
            self._log.info(f'Running {self._collection_name}:{test_name}')
            result = test.run_test(self._do_aot, self._do_native)
            self._log.info(f'{self._collection_name}:{test_name} overall result -> {result}')
            
            if not result:
                self._log.error(f'Failed to execute test "{test_name}" - aborting this run')
                self._test_results = None   # Clear down
                return False
            
            self._test_results[test_name] = result
         
        return True
    
    @property
    def Results(self):
        return self._test_results

    @property
    def HaveResults(self):
        return self._test_results is not None

    @property
    def CollectionName(self):
        return self._collection_name

