#
# Cantata Custom Makefile.
# This makefile contains rules that can be modified to perform any combination of pre and post build actions, 
# as well as different actions before and after each test build.
#
# The rule names are preset and should not be modified. Changing these will result in the Cantata build system
# not functioning correctly.
#
# It is not recommended that this makefile is modified without some knowledge of make commands and syntax. 
#

#
# Makefile variables from the Cantata build system that are available for use with these rules are:
# All variables declared in the config.mk file
# All variables exported from the Makefile file
# 

# If some commands are specific to a particular test (rather than each test in turn) the %/custom_pre_build
# and %/custom_post_build rules below can be overridden by introducing new rules.
# For example, if there are two tests (test_A and test_B) and some commands were necessary before test_A is built
# but not test_B then the following rule could be added into this makefile:
#
# test_A/custom_pre_build :
# 	<Commands>....
#
# With this rule in place, the %/custom_pre_build rule would only get run before test_B was built, and the 
# test_A/custom_pre_build rule would be run before test_A was built.

#
# Define the command used to run QA-C/C++ on configured source code during test builds
#
ifeq ($(RUN_QAC),1)
define QAC_CMD
        @$(ECHO_CMD_MED) ======================================================
        @$(ECHO_CMD_MED) INVOKING QA-C/C++ ANALYSIS FOR $<
        -@qacli analyze -P ../.. -fc $<
        @$(ECHO_CMD_MED) ======================================================
endef
else
define QAC_CMD
        @$(ECHO_CMD_MED) Unused > $(DYNAMIC_THIS_TEST)/filelist.lst
endef
endif

# The custom rules that can be modified are below:

# This rule is automatically executed at the start of any build with the Cantata Makefiles
.PHONY: custom_pre_build
custom_pre_build :
	@echo Performing pre build steps.

# This rule is automatically executed at the end of any build with the Cantata Makefiles
.PHONY: custom_post_build
custom_post_build : 
	@echo Performing post build steps
	@echo

# This rule is automatically executed at the start of every individual test build	
.PHONY: %/custom_pre_build
%/custom_pre_build :
	

# This rule is automatically executed at the end of every individual test build
.PHONY: %/custom_post_build
%/custom_post_build :
	
