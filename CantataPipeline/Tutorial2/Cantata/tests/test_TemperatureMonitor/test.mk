#
# Generated makefile for test "test_TemperatureMonitor"
#

#
# Stop the MAKEFLAGS variable being exported.
# This is needed for sub-make processes to use different options.
#
unexport MAKEFLAGS

#
# The name of the test
#
THIS_TEST := test_TemperatureMonitor

#
# Test script file
#
test_TemperatureMonitor_TESTOBJ := test_TemperatureMonitor

#
# Software under test
#
test_TemperatureMonitor_SUTOBJ := TemperatureMonitor

#
# Compile and link as 'C' or 'CXX'
#
test_TemperatureMonitor_C_OR_CPP_MODE := C

#
# Additional libraries to link
#
test_TemperatureMonitor_EXTLIBS := 

#
# Additional object files to link
#
test_TemperatureMonitor_EXTOBJS := 

#
# Additional defines for this test
#
test_TemperatureMonitor_DEFINES := 

#
# Additional includes for this test
#
test_TemperatureMonitor_INCLUDES := 

#
# Include the test definitions makefile
#
include ../configuration/test_defs.mk

#
# Rules for compiling the software under test
#
test_TemperatureMonitor/TemperatureMonitor.o : ../../TemperatureMonitor.c
	$(MKDIR_CMD) -p test_TemperatureMonitor
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) ../../TemperatureMonitor.c > $(DYNAMIC_THIS_TEST)/filelist.lst
	-@$(QAC_CMD)
	$(subst %DEFINES%, $(foreach define,$(test_TemperatureMonitor_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(test_TemperatureMonitor_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(test_TemperatureMonitor_SUTOBJ),$(COMPILE_CC_CMD))))

#
# Rule for compiling the test script
#
test_TemperatureMonitor/test_TemperatureMonitor.o : test_TemperatureMonitor/test_TemperatureMonitor.c
	$(MKDIR_CMD) -p test_TemperatureMonitor
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) test_TemperatureMonitor/test_TemperatureMonitor.c > $(DYNAMIC_THIS_TEST)/filelist.lst
	$(subst %DEFINES%, $(foreach define,$(test_TemperatureMonitor_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(test_TemperatureMonitor_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(test_TemperatureMonitor_SUTOBJ),$(COMPILE_CC_CMD))))

#
# Rule for linking the test executable
#
$(test_TemperatureMonitor_TEST_EXE) : \
	$(test_TemperatureMonitor_SUTOBJ_FILENAMES) \
	$(test_TemperatureMonitor_TESTOBJ_FILENAMES) \
	$(test_TemperatureMonitor_EXTRA_DEPENDS)
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ",,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,1,0" >> $(CANTPP_TOP_LEVEL_LOG)
	$(subst %EXTLIBS%, $(foreach extlib,$(test_TemperatureMonitor_ALL_EXTLIBS),$(subst %s,$(extlib),$(test_TemperatureMonitor_LINK_EXTLIBOPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/test_TemperatureMonitor,$(subst %EXTOBJS%,$(test_TemperatureMonitor_EXTOBJS),$(CC_LINK_CMD))))
	@$(ECHO_CMD_MED) Built test_TemperatureMonitor successfully

#
# Rule for running the test executable
#
$(test_TemperatureMonitor_CTR_FILE) : $(test_TemperatureMonitor_TEST_EXE)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,1,0,1,0 >> $(CANTPP_TOP_LEVEL_LOG)
	@$(RUN_CMD)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,0,1,0,0 >> $(CANTPP_TOP_LEVEL_LOG)

#
# Rule for ensuring nothing is built/run unless the ctr file is out of date
#
$(test_TemperatureMonitor_RUN) : $(test_TemperatureMonitor_CTR_FILE)

#
# Rule for controlling the building and running of the test executable
#
ifeq ($(EXECUTE),1)
ifeq ($(PUSH_TO_SERVER),1)
$(test_TemperatureMonitor_BUILD_AND_RUN) : 
	-@$(MAKE) $(test_TemperatureMonitor_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Uploading test results to Cantata Server...
	@$(JAVA_CMD) -cp "$(CANTATA_INSTALL_DIR)/bin/client.jar" com.qas.cantata.client.control.CCLC filesToLoad=$(DYNAMIC_THIS_TEST)/.*.ctr,$(DYNAMIC_THIS_TEST)/.*.ctg,$(DYNAMIC_THIS_TEST)/.*.cov,../../TemperatureMonitor.c,$(DYNAMIC_THIS_TEST)/test_TemperatureMonitor.c optionsFiles=../../ipg.cop,$(DYNAMIC_THIS_TEST)/ipg.cop 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(CTR_STATE_CMD)
else
$(test_TemperatureMonitor_BUILD_AND_RUN) : 
	-@$(MAKE) $(test_TemperatureMonitor_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(CTR_STATE_CMD)
endif
else
$(test_TemperatureMonitor_BUILD_AND_RUN) : 
	@$(MAKE) $(test_TemperatureMonitor_TEST_EXE) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Finished $(DYNAMIC_THIS_TEST)
endif

#
# Rules for generating the required folder structure
#

#
# Additional dependencies
#
test_TemperatureMonitor/TemperatureMonitor.o : ../../TemperatureMonitor.h
test_TemperatureMonitor/TemperatureMonitor.o : ../../ipg.cop
test_TemperatureMonitor/TemperatureMonitor.o : test_TemperatureMonitor/ipg.cop
test_TemperatureMonitor/test_TemperatureMonitor.o : ../../TemperatureMonitor.h
test_TemperatureMonitor/test_TemperatureMonitor.o : ../../ipg.cop
test_TemperatureMonitor/test_TemperatureMonitor.o : test_TemperatureMonitor/ipg.cop


