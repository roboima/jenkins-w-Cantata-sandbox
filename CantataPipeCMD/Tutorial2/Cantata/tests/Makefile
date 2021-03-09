#
# Cantata top level makefile
#
# This file is auto generated and should not be modified
#

# Handle the definition of the CONFIG variable, using a default value and raising errors if it doesn't exist.
ifndef CONFIG
CONFIG := test
endif

CONFIG_MAKEFILE := ../configuration/$(CONFIG).mk
ifneq ("$(wildcard $(CONFIG_MAKEFILE))","")
CONFIG_MAKEFILE_EXISTS := 0
else
CONFIG_MAKEFILE_EXISTS := 1
endif
ifneq ($(CONFIG_MAKEFILE_EXISTS), 0)
$(error The configuration makefile specified by the given CONFIG variable does not exist)
endif

# Include the configuration makefile for the chosen CONFIG
include $(CONFIG_MAKEFILE)

#
# Auto updated
#
ALL_TESTS := test_TemperatureMonitor

NUMBER_OF_TESTS := 1

#
# Fixed, no need to modify below
#

export ALL_TESTS
export NUMBER_OF_TESTS

# Parameters passed to this makefile
export DEBUG

#
# Set defaults if not found on command line
#
ifndef $(VERBOSE)
    VERBOSE:=1
endif
ifndef $(OUTPUT_TO_CONSOLE)
    OUTPUT_TO_CONSOLE:=0
endif
ifndef $(EXECUTE)
    EXECUTE:=0
endif
ifndef $(PUSH_TO_SERVER)
    PUSH_TO_SERVER:=0
endif
ifndef $(APPEND_TO_TOP_LEVEL_LOG)
    APPEND_TO_TOP_LEVEL_LOG:=0
endif
ifndef $(TARGET_PROJECT_LOC)
    TARGET_PROJECT_LOC:=
endif
ifndef $(RUN_QAC)
    RUN_QAC:=0
endif

# Export these values to make them available to sub make processes
export OUTPUT_TO_CONSOLE
export EXECUTE
export PUSH_TO_SERVER
export VERBOSE
export TARGET_PROJECT_LOC
export APPEND_TO_TOP_LEVEL_LOG
export RUN_QAC
export CONFIG

# A help rule, used to give users information about how to use the Cantata Makefiles
help : 
	@echo "Cantata Makefiles help."
	@echo "General usage:"
	@echo "To run all tests use 'make all'"
	@echo "To run a single test from the testsuite use 'make <test_name>/do_all'"
	@echo "To clean a test use 'make clean' or"
	@echo "                    'make <test_name>/clean'"
	@echo "Custom rules for pre/post build, and pre/post test build are provided. For further"
	@echo "details about how to use these see the configuration/custom.mk file"
	@echo "Additional settings that can be passed to make are:"
	@echo "VERBOSE - use this to get additional logging information."
	@echo "          Accepted values are 0, 1 or 2"
	@echo "EXECUTE - use this to indicate that the makefile should try to run all the"
	@echo "          given tests. Accepted values are 0 or 1."
	@echo "OUTPUT_TO_CONSOLE - use this to get output from the build and execute to be"
	@echo "                    written to the console as well as the log file."
	@echo "                    Accepted values are 0 or 1."
	@echo "PUSH_TO_SERVER - use this to cause test results to be automatically uploaded"
	@echo "                 to the Cantata Server."
	@echo "                 Accepted values are 0 or 1."
	@echo "RUN_QAC - used to cause a QAC analyse to be executed for each source file"
	@echo "          built (excludes test scripts)"
	@echo "          Accepted values are 0 or 1."
	@echo "CONFIG - set this to the full name of the Cantata deployment to use."
	@echo "         Setting this will override the config setting from the ipg.cop file"
	@echo "         e.g CONFIG=x86-Win32-gcc4.6.2-bundled"

# Dummy rule to prevent make wasting time trying to re-make the init section
Makefile :: ;

# Dummy rule to ensure all targets are re-made
.PHONY FORCE :

ifeq ($(DEBUG),1)
DEBUG_ARGUMENTS :=
else
DEBUG_ARGUMENTS := --no-print-directory
endif

# Make the default rule show the help text
.DEFAULT : help

# Include the makefile containing the custom rules
include ../configuration/custom.mk

# The build all rule. Used when 'make all' is called (this includes when a project is built with the Cantata build configuration)
.PHONY: all
all :
	@$(BUILD_PREFIX) $(MAKE) $(DEBUG_ARGUMENTS) --warn-undefined-variables -r -k do_all 2> ./make_errors.txt

# The rule for actually performing a full build of all tests. Must be executed in a single make job that cannot execute rules in parallel
.PHONY: do_all
do_all : build_all \
         custom_post_build
	
# The clean rule. Used when 'make clean' is called (this includes when a project is cleaned with the Cantata build configuration)
.PHONY: clean
clean :
ifeq ($(APPEND_TO_TOP_LEVEL_LOG),0)
	@$(RM_CMD) $(CANTPP_TOP_LEVEL_LOG)
	@echo "Cantata Version,UserName,NumberofTests,Executable,Compile,Link,Run,Passed,Failed" >> $(CANTPP_TOP_LEVEL_LOG)
endif
	@$(BUILD_PREFIX) $(MAKE) $(DEBUG_ARGUMENTS) --warn-undefined-variables -r -k -f ../configuration/build.mk clean 2> ./make_errors.txt

# The specific do_all rule for individual tests. Used when 'make <test_name>/do_all' is called, and used by the Cantata Run Configuration.
.PHONY: %/do_all
%/do_all : 
ifeq ($(APPEND_TO_TOP_LEVEL_LOG),0)
	@$(RM_CMD) $(CANTPP_TOP_LEVEL_LOG)
	@echo "Cantata Version,UserName,NumberofTests,Executable,Compile,Link,Run,Passed,Failed" >> $(CANTPP_TOP_LEVEL_LOG)
endif
	@$(BUILD_PREFIX) $(MAKE) $(DEBUG_ARGUMENTS) --warn-undefined-variables -r -k -f ../configuration/build.mk $*/do_all 2> ./make_errors.txt

# The specific clean rule for individual tests. Used when 'make <test_name>/clean' is called, and used by the Cantata Run Configuration.
.PHONY: %/clean	
%/clean :
ifeq ($(APPEND_TO_TOP_LEVEL_LOG),0)
	@$(RM_CMD) $(CANTPP_TOP_LEVEL_LOG)
	@echo "Cantata Version,UserName,NumberofTests,Executable,Compile,Link,Run,Passed,Failed" >> $(CANTPP_TOP_LEVEL_LOG)
endif
	@$(BUILD_PREFIX) $(MAKE) $(DEBUG_ARGUMENTS) --warn-undefined-variables -r -k -f ../configuration/build.mk $*/clean 2> ./make_errors.txt

# The build_all rule used to actually build all tests.
.PHONY: build_all
build_all : client_init
ifeq ($(APPEND_TO_TOP_LEVEL_LOG),0)
	@$(RM_CMD) $(CANTPP_TOP_LEVEL_LOG)
	@echo "Cantata Version,UserName,NumberofTests,Executable,Compile,Link,Run,Passed,Failed" >> $(CANTPP_TOP_LEVEL_LOG)
endif
	@$(BUILD_PREFIX) $(MAKE) $(DEBUG_ARGUMENTS) --warn-undefined-variables -r -k -f ../configuration/build.mk all 2> ./make_errors.txt

# The client init rule. This executes the custom pre build rule and then initialises the Cantata Command Line Client for the pending test run	
.PHONY: client_init
client_init: custom_pre_build
ifeq ($(PUSH_TO_SERVER),1)
	@$(JAVA_CMD) -cp "$(CANTATA_INSTALL_DIR)/bin/client.jar" com.qas.cantata.client.control.CCLC optionsFiles=../../ipg.cop 
else
	
endif
	
