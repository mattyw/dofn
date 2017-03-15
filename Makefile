test:
	cabal configure --enable-tests
	cabal build -v
	cabal test
.PHONY: test 

clean:
	cabal clean
.PHONY: clean 
