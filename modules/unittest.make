%:
	gprbuild -P tests/$@/$@test.gpr
	./tests/$@/harness
