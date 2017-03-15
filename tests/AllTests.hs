module Main where

import Test.HUnit

import BackendTests

allTests :: Test
allTests = "alltests" ~: [BackendTests.tests]

main :: IO()
main = do
	counts <- runTestTT allTests
	putStrLn $ showCounts counts

