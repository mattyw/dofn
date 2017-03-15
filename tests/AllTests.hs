module Main where

import Test.HUnit
import System.Exit
import Control.Monad

import BackendTests

allTests :: Test
allTests = "alltests" ~: BackendTests.tests

main = do
	counts <- runTestTT allTests
	when (failures counts > 0 || errors counts > 0)
		exitFailure
