"""
Copyright (C) 2024 Verifoxx Limited
Automated test runner for all benchmarks.
THIS IS A MAIN ENTRY FILE.

Test files are found locally and run remotely on Morello, with AOT files compiled remotely on given host.
Connection configs supplied via JSON file.
"""

import argparse
import logging
import os
import sys

from bm_test_collection import BmTestCollection
from bm_test import (BmTestCoremark, BmTestDhrystone, BmTestPolybench, BmTestSightglass)
from test_runner import BmTestRunner
from result_writer import ResultsWriter

WAMR_CHERI_BENCHMARK_JSON = 'WAMR_CHERI_BENCHMARK_JSON'
REPEAT_COUNT_DEFAULT=5

def main():
    parser = argparse.ArgumentParser(description='Automated Benchmark Tester')
    parser.add_argument('-f', '--folder', help='Folder containing benchmark WASMs (required)', dest='folder', required=True)
    parser.add_argument('-o', '--output', help='CSV File to save results to (required)', dest='output_csv', required=True)
    parser.add_argument('--c', '--config', dest='config', help=f'JSON Config filename, default loads from OS setting "{WAMR_CHERI_BENCHMARK_JSON}"')
    parser.add_argument('-aot', action='store_true', help='Run AOT tests (default false)', dest='do_aot')
    parser.add_argument('-native', action='store_true', help='Run Native tests (default false)', dest='do_native')
    parser.add_argument('-r', '--repcount', type=int, help=f'Repeat count (default={REPEAT_COUNT_DEFAULT}', dest='rep_count', default=REPEAT_COUNT_DEFAULT)        
    parser.add_argument('-v', action='store_true', help='Verbose logging (default minimal logging)', dest='verbose')
    parser.add_argument('-l', '--log', dest='logfile', help='Name of logfile to create (default is log only to stdout)')
    
    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format='%(asctime)s %(levelname)s: %(message)s',
        handlers=[logging.StreamHandler(sys.stdout)] + ([logging.FileHandler(args.logfile)] if args.logfile else []),
    )

    log = logging.getLogger(__name__)
    
    log.info(f'{sys.argv[0]} processing...')
    

    json_file = os.getenv("WAMR_CHERI_BENCHMARK_JSON") if not args.config else args.config

    # Create the test runner
    test_runner = BmTestRunner(json_file, args.rep_count)
    
    # Create the collections
    log.info('Create collections...')
    collections = [
        BmTestCollection('Coremark', 'coremark', args.folder, BmTestCoremark, test_runner, args.do_aot, args.do_native),
        BmTestCollection('Dhrystone', 'dhrystone', args.folder, BmTestDhrystone, test_runner, args.do_aot, args.do_native),
        BmTestCollection('Polybench', 'polybench', args.folder, BmTestPolybench, test_runner, args.do_aot, args.do_native),
        BmTestCollection('Sightglass', 'sightglass', args.folder, BmTestSightglass, test_runner, args.do_aot, args.do_native),        
        ]

    log.info('Run collections...')
    for collection in collections:
        if not collection.run():
            log.error(f'Collection {collection.Name} failed!')
            # Carry on anyway
    
    # Generate CSV results
    result_writer = ResultsWriter(args.output_csv, collections)
    result_writer.make_csv()
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
