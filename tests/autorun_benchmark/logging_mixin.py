"""
Copyright (C) 2024 Verifoxx Limited
"""
# Simple mixin to get logging output

import logging

class LoggingMixin:
    """ Mixin for classes wanting a logger. """

    def __init__(self, name=None):
        if name is None:
            name = self.__class__.__name__
            
        self._log = logging.getLogger(name)
