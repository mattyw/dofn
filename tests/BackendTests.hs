module BackendTests where

import Test.HUnit

import Backend.Backend

test1 = TestCase do
    x <- foobar 2
    assertEqual 4 x


tests = [test1]
