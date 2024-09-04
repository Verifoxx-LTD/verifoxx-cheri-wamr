"""
Copyright (C) 2024 Verifoxx Limited
Post-processor for the automated test runner outputs.
THIS IS A MAIN ENTRY FILE.

Parses the full generated CSV from the test runner, which records times taken.
Processes and outputs percentage speedups of hybrid vs purecap for each test in a collection,
or optionally an average of percentage speedup for all tests in the colleciton.
"""

import argparse
import logging
import sys
import csv
from enum import Enum
from statistics import fmean

from csv_common import RowFieldType

from bm_test import BmTestResult
from test_runner import (TestFileType, TestType)

class PercentRowType(str, Enum):
    """ CSV Writer fields for our summary output file. """
    CollName = 'Test Group'
    TestName = 'Test Name'
    NativePercent = 'Native Hybrid percent faster'
    AotPercent = 'AOT Hybrid percent faster'
    WasmPercent = 'WASM Hybrid percent faster'

""" Map a test file type to a CSV header field. """
MAPPER_DICT = {
    TestFileType.WASM: PercentRowType.WasmPercent.value,
    TestFileType.AOT: PercentRowType.AotPercent.value,
    TestFileType.NATIVE: PercentRowType.NativePercent.value,
}


def _make_result(row_dict):
    """ Create BmTestResult() from a parsed CSV row. """
    result_obj = BmTestResult()

    for tft_tt_tuple in result_obj.get_test_pair():
        tft, tt = tft_tt_tuple
        result_obj.set_result(tft, tt, row_dict.get(result_obj.get_csv_fieldname(tft, tt), 0.0))

    return result_obj
    
def _make_percent(*, hybrid, purecap, as_string=True):
    """ Return a percent which is a speedup of hybrid being x % faster than purecap
        (for -ve then purecap faster).
        Optionally return as string, or float
    """
    try:
        hybrid = float(hybrid)
    except ValueError:
        hybrid = 0.0
        
    try:
        purecap = float(purecap)
    except ValueError:
        purecap = 0.0
        
    
    if hybrid and purecap:
        percent = 100.0 * ((purecap - hybrid) / hybrid)
        return '{:.2f}'.format(percent) if as_string else percent
    return '0' if as_string else 0.0

def _build_percent_dict(coll_name, test_name, results_obj):
    """ Create a CSV output row for the one-line-per-test output file. """
    row_dict = {
                PercentRowType.CollName.value: coll_name,
                PercentRowType.TestName.value: test_name
    }
    
    # For each TestFileType, calculate the percentage as a % increase of hybrid speed
    for tft, result in results_obj:
        row_dict[MAPPER_DICT[tft]] = _make_percent(hybrid=result.get(TestType.HYBRID),
                                                   purecap=result.get(TestType.PURECAP)
                                                   )

    return row_dict

def _build_summary_percent_dict(coll_name, test_dict):
    """ Create a CSV output row for the one-line-per-collection summary output file. """
    # For each TFT type, build a list of percents:
    tft_dict = dict()
    row_dict = {PercentRowType.CollName.value: coll_name}
    
    for _, results_obj in test_dict.items():
        for tft, result in results_obj:
            res_list = tft_dict.get(tft, [])
            res_list.append(_make_percent(hybrid=result.get(TestType.HYBRID),
                                          purecap=result.get(TestType.PURECAP),
                                          as_string=False
                                        )
                        )
            tft_dict[tft] = res_list
    
    # Now average out the percentages we calculated, but importantly ignore any which are zero
    for tft, res_list in tft_dict.items():
        filtered_list = [val for val in res_list if val != 0.0]
        row_dict[MAPPER_DICT[tft]] = '{:.2f}'.format(fmean( filtered_list if filtered_list else [0.0] ))
        
    
    return row_dict    

def _get_header_row_list():
    return list(map(lambda x: x.value, PercentRowType._member_map_.values()))

def _get_summary_header_row_list():
    """ Same as _get_header_row_list() but no Test Name field. """    
    return list(filter(lambda x: x != PercentRowType.TestName.value, _get_header_row_list()))
     
def main():
    parser = argparse.ArgumentParser(description='Automated Benchmark CSV Processor')
    parser.add_argument('-i', '--input', help='Input raw CSV file (required)', dest='input', required=True)
    parser.add_argument('-o', '--output', help='Summary CSV File to save output to (required)', dest='output', required=True)
    parser.add_argument('--s', '--summary', dest='summary', action='store_true', help='Generate Summary Only')
    parser.add_argument('-v', action='store_true', help='Verbose logging (default minimal logging)', dest='verbose')

    args = parser.parse_args()

    logging.basicConfig(
        level=logging.DEBUG if args.verbose else logging.INFO,
        format='%(asctime)s %(levelname)s: %(message)s',
        handlers=[logging.StreamHandler(sys.stdout)]
    )

    log = logging.getLogger(__name__)
    
    log.info(f'{sys.argv[0]} processing...')
    
    collections_dict = dict()
    
    # Read in the CSV to dictionary structure
    with open(args.input, 'r', newline='') as csvfile:
        reader = csv.DictReader(csvfile)

        # Build up per collection and per test
        # Each row is a single test name, multiple rows per collection
        for row in reader:
            collname = row[RowFieldType.CollName.value]
            testname = row[RowFieldType.TestName.value]
            result_obj = _make_result(row)
            
            tests_dict = collections_dict.get(collname, dict())
            tests_dict[testname] = result_obj
            collections_dict[collname] = tests_dict # Update

    # Now have a dictionary of collection -> test -> results and can generate output
    if args.summary:
        with open(args.output, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames = _get_summary_header_row_list())
            writer.writeheader()
    
            for collname, tests_dict in collections_dict.items():
                writer.writerow(_build_summary_percent_dict(collname, tests_dict))

    else:
        
        with open(args.output, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames = _get_header_row_list())
            writer.writeheader()
    
            for collname, coll_dict in collections_dict.items():
                for test_name, results_obj in coll_dict.items():
                    writer.writerow(_build_percent_dict(collname, test_name, results_obj))
    
    return 0

if __name__ == "__main__":
    sys.exit(main())

