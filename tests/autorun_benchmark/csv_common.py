"""
Copyright (C) 2024 Verifoxx Limited
"""
# Common CSV class, used by both the full test writer and the post-processor

from enum import Enum

class RowFieldType(str, Enum):
    CollName = 'Test Group'
    TestName = 'Test Name'

