ifdef OS
    EXT=.exe
else
    EXT=
endif

INCLUDES = -I. \
	-Imodules/binarytree \
	-Imodules/stack \
	-Imodules/utils

%$(EXT):
	gnatmake $(INCLUDES) $*-src/$*
	mv $* $*-src
	mv $*.* $*-src
	cat $*-src/$*.txt | dos2unix | ./$*-src/$*$(EXT)

%_2$(EXT):
	gnatmake $(INCLUDES) $*-src/$*_2
	mv $*_2 $*-src
	mv $*_2.* $*-src
	cat $*-src/$*.txt | dos2unix | ./$*-src/$*_2$(EXT)

%-clean:
	rm $*-src/$*$(EXT)
	rm $*-src/$*_2$(EXT)
