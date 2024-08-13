"""
Copyright (C) 2024 Verifoxx Limited
"""

# Represents a single benchmark test and the complex test results handling object

from test_runner import (TestType, TestFileType)
from logging_mixin import LoggingMixin


class BmTestResult:
    """ Holds results for the different runs. If any is None, this test failed. """
    
    def __init__(self):
        """ Map of test types, each of which is purecap or hybrid. """
        self._result_dict = {tft: dict.fromkeys(TestType, None) for tft in TestFileType}
        
    def get_csv_fieldname(self, tft, tt):
        return f'{self.get_tft_suffix(tft)} {self.get_tft_suffix(tt)}'
    
    def get_tft_suffix(self, x):
        return str(x).split('.')[1]
    
    def __str__(self):
        results_list = []
        for test_type, v in self._result_dict.items():
            for purecap_or_hybrid, result in v.items():
                results_list.append(f'{self.get_tft_suffix(test_type)}:{self.get_tft_suffix(purecap_or_hybrid)}={result}')
        
        return '; '.join(results_list)

    def get_test_pair(self, do_aot=True, do_native=True):
        """ Generator which yields a TestFieldType, TestType pair for each test to be run. """
        
        for k, v in self._result_dict.items():
            if not do_aot and self.get_tft_suffix(k).upper() == 'AOT' or not do_native and self.get_tft_suffix(k).upper() == 'NATIVE':
                continue
            
            for hybrid_or_wasm in v.keys():
                yield (k, hybrid_or_wasm)
        
    def get_result(self, tft_and_tt):
        tft, tt = tft_and_tt
        return_val = self._result_dict[tft][tt]
        if not return_val:
            return_val = 0.0
        return return_val

    def set_result(self, tft, tt, result_time):
        self._result_dict[tft][tt] = result_time
    
    def __iter__(self):
        return iter(self._result_dict.items())

class BmTest(LoggingMixin):
    """ Abstract class to represents a single benchmark test, which can be run and give a time taken result for hybrid and for purecap """
    
    NATIVE_SUFFIXES = {TestType.HYBRID: '_native-hybrid', TestType.PURECAP: '_native-purecap'}
    
    def __init__(self, test_name, test_wasm, test_runner):
        """ Given: Friendly name of test, WASM file, BmTestRunner instance, number of times to run the test to average result """
        super().__init__()
        self._test_name = test_name
        self._test_wasm = test_wasm
        self._runner = test_runner
        self._hybrid_result = None         # Seconds taken for hybrid (average)
        self._purecap_result = None         # Seconds taken for purecap (average)
        
        self._log.debug(f'Creating BmTest[{test_name} : {test_wasm}]')
        # Set the callback function for this test
        self._runner.set_callback(None)
        
    def run_test(self, do_aot=True, do_native=True):
        """ Run the test on the remote system. We do two runs, one for hybrid and one for purecap.  Returns a BmTestResult object. """
        results = BmTestResult()
        self._runner.set_callback(self.stdout_test_parser_fn)

        for tft, tt in results.get_test_pair(do_aot, do_native): 
            test_file = self._test_wasm
            if tft == TestFileType.NATIVE:
                test_file = self._test_wasm.with_name('{}{}'.format(self._test_wasm.stem, self.NATIVE_SUFFIXES[tt]))
                
                if not test_file.exists():
                    continue
                
            results.set_result(tft, tt, self._runner.run_test(test_file, tt, tft, None, self.iwasm_exit_code()))
   
        return results

    def stdout_test_parser_fn(self, stdout_string):
        raise NotImplementedError('Must subclass BmTestResult!')
    
    def iwasm_exit_code(self):
        """ Get expected exit code from the iwasm program for this WASM """
        return 0

class BmTestPolybench(BmTest):
    """ BmTest instance for Polybench tests. """
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._log.debug('Created BmTestPolybench Instance')
        
    def stdout_test_parser_fn(self, stdout_string):
        # Straight forward parse for this one
        try:
            return float(stdout_string.strip().strip('\n'))
        except ValueError:
            return None
    
class BmTestDhrystone(BmTest):
    """ BmTest instance for Dhrystone tests. """
    
    DHRYSTONE_PREFIX = 'Microseconds for one run through Dhrystone:'
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._log.debug('Created BmTestDhrystone Instance')
        
    def stdout_test_parser_fn(self, stdout_string):
        # Find line which is microseconds for one dhrystone
        for line in stdout_string.splitlines():
            if line.find(self.DHRYSTONE_PREFIX) != -1:
                try:
                    f = float(line.replace(self.DHRYSTONE_PREFIX, '', 1).strip())
                    return f    # Times in dhrystone are microseconds!
                except ValueError:
                    pass
        return None

    def iwasm_exit_code(self):
        """ Get expected exit code from the iwasm program for this WASM """
        # Dhrystone returns 1 on success
        return 1


class BmTestCoremark(BmTest):
    """ BmTest instance for Coremark tests. """
    
    COREMARK_PREFIX = 'Total time (secs):'
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._log.debug('Created BmTestCoremark Instance')
        
    def stdout_test_parser_fn(self, stdout_string):
        # Find line which is microseconds for one dhrystone
        for line in stdout_string.splitlines():
            if line.find(self.COREMARK_PREFIX) != -1:
                try:
                    return float(line.replace(self.COREMARK_PREFIX, '', 1).strip())
                except ValueError:
                    pass
        return None
            
