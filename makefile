%.exe: %.adb
	gnatmake $*
	cat $*.txt | dos2unix | ./$*.exe

%_2.exe: %.adb
	gnatmake $*_2
	cat $*.txt | dos2unix | ./$*_2.exe
