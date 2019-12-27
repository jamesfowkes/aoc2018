.PHONY: binarytree queue stack utils

binarytree:
	gprbuild -P tests/binarytree/binarytreetest.gpr
	./tests/binarytree/harness

queue:
	gprbuild -P tests/queue/queuetest.gpr
	./tests/queue/harness

stack:
	gprbuild -P tests/stack/stacktest.gpr
	./tests/stack/harness

utils:
	gprbuild -P tests/utils/utilstest.gpr
	./tests/utils/harness

all: binarytree queue stack utils

clean:
	rm -f ./tests/binarytree/harness
	rm -f ./tests/queue/harness
	rm -f ./tests/stack/harness
	rm -f ./tests/utils/harness