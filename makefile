%.exe: %.adb
	gnatmake $*
	cat $*.txt | dos2unix | ./$*.exe
