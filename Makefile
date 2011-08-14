# DO NOT DELETE: Beginning of Haskell dependencies
Generator.o : Generator.hs
Solver.o : Solver.hs
# DO NOT DELETE: End of Haskell dependencies

clean :
	rm *.hi *.o Generator Solver

build : 
	ghc --make Generator
	ghc --make -O2 Solver

remote_add :
	remote add origin git@github.com:akiradeveloper/Siritori.git

push :
	git push -u origin master
