"""
Copyright (C) 2024 Verifoxx Limited
"""

# This module writes the full format results to a CSV for each test in each collection

import csv
from logging_mixin import LoggingMixin
from bm_test import BmTestResult
from pathlib import Path
from csv_common import RowFieldType

class ResultsWriter(LoggingMixin):
    """ Writes the results to CSV file. """
    
    def __init__(self, output_file, collections):
        """ Given: output file, as pathlib. """
        super().__init__()
                
        self._output_file = Path(output_file)
        # Make path for file
        self._output_file.parent.mkdir(parents=True, exist_ok=True)

        self._collections = collections
        
        dummy_result = BmTestResult()
        
        # Generate the row dict we'll use - any dummy result is valid
        self._row_dict = {k:v.value for k, v in RowFieldType._member_map_.items()}
        
        self._row_dict.update(
            {(tft, tt): dummy_result.get_csv_fieldname(tft, tt) for tft, tt in dummy_result.get_test_pair()}
        )
        

    def _get_header_row_list(self):
        """ Build header row - we just need any results object to generate the field names. """
        return self._row_dict.values()
                
    def _build_output_row(self, coll_name, test_name, result_obj):
        """ Build a dictionary for the output row (using row_dict values as keys), based on all the results we have """
        # This should be made a bit more automated
        out_dict = dict()
        
        out_dict[self._row_dict[RowFieldType.CollName.name]] = coll_name
        out_dict[self._row_dict[RowFieldType.TestName.name]] = test_name
        
        for tft_tt_tuple in result_obj.get_test_pair():
            out_dict[self._row_dict[tft_tt_tuple]] = '{:.6f}'.format(result_obj.get_result(tft_tt_tuple))
        
        return out_dict
        
    def make_csv(self):
        """ Write the CSV file, raise exception on error. """
        
        with open(self._output_file, 'w', newline='') as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames = self._get_header_row_list())

            writer.writeheader()
            # Enumerate collections and tests within them
            for collection in self._collections:
            
                if collection.HaveResults:
                    for test_name, result in collection.Results.items():
                        writer.writerow(self._build_output_row(collection.CollectionName,
                                                           test_name,
                                                           result))
        
        return True
