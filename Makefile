# place amlc.jar in this folder or change value.
AMLC:=amlc.jar
CMD=java -jar $(AMLC)

build:
	$(CMD) build . -bt linux-x64 -ll5 -maxOneError

build-fld: # force load dependencies
	$(CMD) build . -fld -bt linux-x64 -ll5 -maxOneError

TEST_ASSETS_SRC := tests/assets
TEST_ASSETS_DST := builds/test-bin/linux-x64/assets

copy-test-assets:
	mkdir -p $(TEST_ASSETS_DST)
	cp -r $(TEST_ASSETS_SRC)/. $(TEST_ASSETS_DST)/

test: copy-test-assets
	$(CMD) test . -bt linux-x64 -maxOneError
