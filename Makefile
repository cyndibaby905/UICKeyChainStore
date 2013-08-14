PROJECT = UICKeyChainStore.xcodeproj
TEST_TARGET = Tests

test:
	xctool \
		-project $(PROJECT) \
		-scheme $(TEST_TARGET) \
		-sdk iphonesimulator \
		-configuration Debug \
		clean test \
		ONLY_ACTIVE_ARCH=NO \
		TEST_AFTER_BUILD=YES
		
test-with-coverage:
	xctool \
		-project $(PROJECT) \
		-scheme $(TEST_TARGET) \
		-sdk iphonesimulator \
		-configuration Debug \
		clean test \
		ONLY_ACTIVE_ARCH=NO \
		TEST_AFTER_BUILD=YES \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES
		
send-coverage:
	coveralls \
		-e UICKeyChainStore \
		-e UICKeyChainStoreTests \
		--verbose