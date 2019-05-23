ifdef OS
    EXT=.exe
else
    EXT=
endif

WARNINGS_AS_ERRORS = -gnatwe
#SWITCHES = -gnat12 -gnatf -gnatQ -gnatwa -gnatyy  -gnatyM120 $(WARNINGS_AS_ERRORS)
SWITCHES = -gnat12 -gnatf -gnatQ -gnatwa -gnatyy  -gnatyM120

INCLUDES = -I. \
	-Imodules/binarytree \
	-Imodules/stack \
	-Imodules/utils

ALL_TEST_FOLDERS = $(sort $(wildcard d*-src))
ALL_TESTS = $(subst -src, , $(ALL_TEST_FOLDERS))
ALL_DAY1_TESTS := $(foreach TEST,$(ALL_TESTS),$(TEST)$(EXT))
ALL_DAY2_TESTS := $(foreach TEST,$(ALL_TESTS),$(TEST)_2$(EXT))

ALL_CLEAN_TARGETS := $(foreach TEST,$(ALL_TESTS), $(TEST)-clean)

%$(EXT):
	gnatmake $(SWITCHES) $(INCLUDES) $*-src/$*
	mv $* $*-src
	mv $*.* $*-src
	cat $*-src/$*.txt | dos2unix | ./$*-src/$*$(EXT) $(ARGS)

%_2$(EXT):
	gnatmake $(SWITCHES) $(INCLUDES) $*-src/$*_2
	mv $*_2 $*-src
	mv $*_2.* $*-src
	cat $*-src/$*.txt | dos2unix | ./$*-src/$*_2$(EXT) $(ARGS)

%-clean:
	rm -f $*-src/$*$(EXT)
	rm -f $*-src/$*_2$(EXT)

clean: $(ALL_CLEAN_TARGETS)
	rm -f *.o
	rm -f *.ali

all: $(ALL_DAY1_TESTS) $(ALL_DAY2_TESTS)