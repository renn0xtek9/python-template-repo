"""Example of unittest file"""

import unittest

from .example import return_something, return_two


class TestReturnTwo(unittest.TestCase):
    def test_return_two(self):
        self.assertEqual(2, return_two())


class TestReturnSomething(unittest.TestCase):
    def test_return_something(self):
        self.assertEqual("something", return_something("something"))
