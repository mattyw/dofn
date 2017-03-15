module Main where

--import Test.Framework (defaultMain)
--import Test.Framework.Providers.HUnit (hUnitTestToTests)
import Test.HUnit

import BackendTests

allTests :: Test
allTests = TestList
    [ TestLabel "Backend" BackendTests.tests
    ]

main :: IO()
--main = defaultMain $ hUnitTestToTests allTests
main = runTestTT allTests
