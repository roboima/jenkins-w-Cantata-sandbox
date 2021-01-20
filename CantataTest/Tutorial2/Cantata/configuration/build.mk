#
# This file is auto generated and should not be modified
#

include ../configuration/build_defs.mk

default : all

all : $(ALL_TESTS)

	
INCLUDE_TESTS = $(foreach tst, $(ALL_TESTS), $(tst)/test.mk)

$(INCLUDE_TESTS) : ;
include $(INCLUDE_TESTS)

# Setup decode results dependencies - This is used if we cannot run the tests
# ourselves, we can still demultiplex any output etc...
DECODE_RESULTS = $(foreach tst, $(ALL_TESTS), $(tst)/decode_results)

.PHONY: decode_results
decode_results: $(DECODE_RESULTS)
	@$(ECHO_CMD) Results demultiplexed

# Setup clean dependencies
CLEAN_TESTS = $(foreach tst, $(ALL_TESTS), $(tst)/clean)

.PHONY: clean
clean: $(CLEAN_TESTS)
	@$(ECHO_CMD) Clean complete
