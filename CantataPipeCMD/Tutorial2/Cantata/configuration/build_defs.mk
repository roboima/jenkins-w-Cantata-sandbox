#
# This file is auto generated and should not be modified
#

include ../configuration/$(CONFIG).mk

##
# COMMANDS
##

# Output commands
ifeq ($(DEBUG),1)
    ECHO_DEBUG_CMD := $(ECHO_CMD)
else
    ECHO_DEBUG_CMD := \#
endif

ifeq ($(VERBOSE),0)
    ECHO_CMD_MIN := $(ECHO_CMD)
    ECHO_CMD_MED := \#
    ECHO_CMD_HIGH := \#
    BUILD_REDIR := >> %BUILD_OUTPUT% 2>&1
else
    ifeq ($(VERBOSE),1)
        ECHO_CMD_MIN := $(ECHO_CMD)
        ECHO_CMD_MED := $(ECHO_CMD)
        ECHO_CMD_HIGH := \#
        BUILD_REDIR := >> %BUILD_OUTPUT% 2>&1
    else
        ifeq ($(VERBOSE),2)
            ECHO_CMD_MIN := $(ECHO_CMD)
            ECHO_CMD_MED := $(ECHO_CMD)
            ECHO_CMD_HIGH := $(ECHO_CMD)
            BUILD_REDIR :=
        endif
    endif
endif

##
# RULES
##

#
# Compile rules
#
define COMPILE_CC_CMD
        @$(ECHO_CMD_MED) "Compiling (C) ... $< -> $@"
        @$(ECHO_DEBUG_CMD) "Full command line:"
        @$(ECHO_DEBUG_CMD) "$(subst %DIR%,$(patsubst %$(word $(words $(subst /, ,$@)),$(subst /, ,$@)),%,$@),$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG))) --no_link $(DEFAULT_COMPILER_NAME) $(subst %f, "$<", $(subst %o, $@, $(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_COMPILER_OPTS)))) $(DEBUG_FLAGS) %DEFINES% %INCLUDES%"
        @$(subst %DIR%,$(patsubst %$(word $(words $(subst /, ,$@)),$(subst /, ,$@)),%,$@),$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG))) --no_link $(DEFAULT_COMPILER_NAME) $(subst %f, "$<", $(subst %o, $@, $(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_COMPILER_OPTS)))) $(DEBUG_FLAGS) %DEFINES% %INCLUDES%
endef

define COMPILE_CXX_CMD
        @$(ECHO_CMD_MED) "Compiling (C++)... $< -> $@"
        @$(ECHO_DEBUG_CMD) "Full command line:"
        @$(ECHO_DEBUG_CMD) "$(subst %DIR%,$(patsubst %$(word $(words $(subst /, ,$@)),$(subst /, ,$@)),%,$@),$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG))) --no_link $(DEFAULT_COMPILER_NAME) $(subst %f, "$<", $(subst %o, $@, $(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_COMPILER_OPTS)))) $(DEBUG_FLAGS) %DEFINES% %INCLUDES%"
        @$(subst %DIR%,$(patsubst %$(word $(words $(subst /, ,$@)),$(subst /, ,$@)),%,$@),$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG))) --no_link $(DEFAULT_COMPILER_NAME) $(subst %f, "$<", $(subst %o, $@, $(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_COMPILER_OPTS)))) $(DEBUG_FLAGS) %DEFINES% %INCLUDES%
endef

#
# Link rules
#
define CC_LINK_CMD
        @$(ECHO_CMD_MED) "Linking (C) $@ ..."
        @$(ECHO_DEBUG_CMD) "$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG)) $(DEFAULT_LINKER_NAME) $(subst %f, $(patsubst %ipg.cop,,$(patsubst %.mk,,$(patsubst %.cfg,,$^))), $(subst %o,$@,$(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_LINKER_OPTS)))) $(C_LINK_FINALOPTS) %EXTLIBS% %EXTOBJS%"
        @$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG)) $(DEFAULT_LINKER_NAME) $(subst %f, $(patsubst %ipg.cop,,$(patsubst %.mk,,$(patsubst %.cfg,,$^))), $(subst %o,$@,$(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_LINKER_OPTS)))) $(C_LINK_FINALOPTS) %EXTLIBS% %EXTOBJS%
endef

define CXX_LINK_CMD
        @$(ECHO_CMD_MED) "Linking (C++) $@ ..."
        @$(ECHO_DEBUG_CMD) "$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG)) $(DEFAULT_LINKER_NAME) $(subst %f, $(patsubst %ipg.cop,,$(patsubst %.mk,,$(patsubst %.cfg,,$^))), $(subst %o,$@,$(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_LINKER_OPTS)))) $(CPP_LINK_FINALOPTS) %EXTLIBS% %EXTOBJS%"
        @$(subst %COP%,../../ipg.cop -F $(DYNAMIC_THIS_TEST)/ipg.cop,$(CANTPP_CMD) --comp:$(CONFIG)) $(DEFAULT_LINKER_NAME) $(subst %f, $(patsubst %ipg.cop,,$(patsubst %.mk,,$(patsubst %.cfg,,$^))), $(subst %o,$@,$(subst %i, $(CANTATA_INSTALL_DIR), $(DEFAULT_LINKER_OPTS)))) $(CPP_LINK_FINALOPTS) %EXTLIBS% %EXTOBJS%
endef

#
# Decoding multiplexed output rule
#

ifeq ($(MULTIPLEXED_OUTPUT),1)
    DEMULT_OP := cppconv %TEST%/%TEST_NAME%_output.txt --basename %TEST_NAME%
    define DEMULT_CMD
    	@$(ECHO_DEBUG_CMD) "Demultiplexing command : $(subst %TEST%,$(DYNAMIC_THIS_TEST),$(subst %TEST_NAME%,$($(DYNAMIC_THIS_TEST)_TESTOBJ),$(subst %BUILD_OUTPUT%,$(DYNAMIC_THIS_TEST)/build_output.txt,$(DEMULT_OP)$(BUILD_REDIR))))"
        @$(ECHO_CMD_MIN) -n Demultiplexing $(DYNAMIC_THIS_TEST) results ...
        @($(subst %TEST%,$(DYNAMIC_THIS_TEST),$(subst %TEST_NAME%,$($(DYNAMIC_THIS_TEST)_TESTOBJ),$(subst %BUILD_OUTPUT%,$(DYNAMIC_THIS_TEST)/build_output.txt,$(DEMULT_OP)$(BUILD_REDIR)))) && $(ECHO_CMD_MIN) " done" ) || $(ECHO_CMD_MIN) " failed"
    endef
else
    DEMULT_OP :=
    define DEMULT_CMD
    endef
endif

#
# Execute tests rules
#
ifneq ($(EXECUTE_CMD),)

    ifeq ($(REDIRECT_OUTPUT),1)
        ifeq ($(OUTPUT_TO_CONSOLE),1)
            define RUN_CMD
                    @$(ECHO_DEBUG_CMD) "Command to run test executable : $(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD)) >> $(DYNAMIC_THIS_TEST)/$(DYNAMIC_THIS_TEST).log 2>&1 )"
                    @$(ECHO_CMD_MIN) -n Running $(DYNAMIC_THIS_TEST) ... 
                    @$(ECHO_CMD_MIN) 
                    @($(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE),$(subst %DIR%, $(DYNAMIC_THIS_TEST), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD))) ) && $(ECHO_CMD_MIN) "Test complete" ) || $(ECHO_CMD_MIN) "Test complete"
                    @$(DEMULT_CMD)
            endef
         else
            define RUN_CMD
                    @$(ECHO_DEBUG_CMD) "Command to run test executable : $(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD) >> $(DYNAMIC_THIS_TEST).log 2>&1 ))"
                    @$(ECHO_CMD_MIN) -n Running $(DYNAMIC_THIS_TEST) ... 
                    @$(ECHO_CMD_MIN)
                    @($(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE),$(subst %DIR%, $(DYNAMIC_THIS_TEST), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD))) >> $(DYNAMIC_THIS_TEST).log 2>&1 ) && $(ECHO_CMD_MIN) "Test complete" ) || $(ECHO_CMD_MIN) "Test complete"
                    @$(DEMULT_CMD)
                    endef
                 endif        
    else
        ifeq ($(OUTPUT_TO_CONSOLE),1)
                define RUN_CMD
                        @$(ECHO_DEBUG_CMD) "Command to run test executable : $(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD) ))"
                        @$(ECHO_CMD_MIN) -n Running $(DYNAMIC_THIS_TEST) ... 
                        @$(ECHO_CMD_MIN) 
                        @($(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE),$(subst %DIR%, $(DYNAMIC_THIS_TEST), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD)))) && $(ECHO_CMD_MIN) "Test complete" ) || $(ECHO_CMD_MIN) "Test complete"
                        @$(DEMULT_CMD)
                endef
        else
                define RUN_CMD
                        @$(ECHO_DEBUG_CMD) "Command to run test executable : $(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD) ))"
                        @$(ECHO_CMD_MIN) -n Running $(DYNAMIC_THIS_TEST) ... 
                        @$(ECHO_CMD_MIN)
                        @($(subst %TEST_EXE%,$($(DYNAMIC_THIS_TEST)_TEST_EXE),$(subst %DIR%, $(DYNAMIC_THIS_TEST), $(subst %i, $(CANTATA_INSTALL_DIR), $(EXECUTE_CMD))) >> $(DYNAMIC_THIS_TEST).log 2>&1 ) && $(ECHO_CMD_MIN) "Test complete" ) || $(ECHO_CMD_MIN) "Test complete"
                        @$(DEMULT_CMD)
                        endef
                endif
    endif
else
    define RUN_CMD
            @$(ECHO_CMD_MIN) Not running $(DYNAMIC_THIS_TEST)
    endef
endif

#
# Clean rule
#
define CLEAN_CMD
        @$(ECHO_DEBUG_CMD) Clean command :
        @$(ECHO_DEBUG_CMD) $(RM_CMD) $($(DYNAMIC_THIS_TEST)_TESTOBJ_FILENAMES) $($(DYNAMIC_THIS_TEST)_SUTOBJ_FILENAMES) $($(DYNAMIC_THIS_TEST)_TEST_EXE) $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_TESTOBJ)_output.txt $(DYNAMIC_THIS_TEST)/build_output.txt $(DYNAMIC_THIS_TEST)/*.ii $(DYNAMIC_THIS_TEST)/*.ti $(DYNAMIC_THIS_TEST)/*.di $($(DYNAMIC_THIS_TEST)_TESTOBJ_CSI) $($(DYNAMIC_THIS_TEST)_SUTOBJ_CSI) $($(DYNAMIC_THIS_TEST)_TESTOBJ_CI) $($(DYNAMIC_THIS_TEST)_SUTOBJ_CI) $($(DYNAMIC_THIS_TEST)_TESTOBJ_SM) $($(DYNAMIC_THIS_TEST)_SUTOBJ_SM) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg $(DYNAMIC_THIS_TEST)/*.log
        @$(ECHO_CMD_MED) -n Cleaning $(DYNAMIC_THIS_TEST) ...
        @$(RM_CMD) $($(DYNAMIC_THIS_TEST)_TESTOBJ_FILENAMES) $($(DYNAMIC_THIS_TEST)_SUTOBJ_FILENAMES) $($(DYNAMIC_THIS_TEST)_TEST_EXE) $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_TESTOBJ)_output.txt $(DYNAMIC_THIS_TEST)/build_output.txt $(DYNAMIC_THIS_TEST)/*.ii $(DYNAMIC_THIS_TEST)/*.ti $(DYNAMIC_THIS_TEST)/*.di $($(DYNAMIC_THIS_TEST)_TESTOBJ_CSI) $($(DYNAMIC_THIS_TEST)_SUTOBJ_CSI) $($(DYNAMIC_THIS_TEST)_TESTOBJ_CI) $($(DYNAMIC_THIS_TEST)_SUTOBJ_CI) $($(DYNAMIC_THIS_TEST)_TESTOBJ_SM) $($(DYNAMIC_THIS_TEST)_SUTOBJ_SM) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg $(DYNAMIC_THIS_TEST)/*.log
        @$(ECHO_CMD_MED) " done"
endef

#
# CTR state rule
#
define CTR_STATE_CMD
	@$(ECHO_DEBUG_CMD) CTR State command :
	@$(ECHO_DEBUG_CMD) $(CTR_STATE) --log_file:$(CANTPP_TOP_LEVEL_LOG) --tests:$(NUMBER_OF_TESTS) --test_name:$(DYNAMIC_THIS_TEST) $($(DYNAMIC_THIS_TEST)_CTR_FILE)
	@$(CTR_STATE) --log_file:$(CANTPP_TOP_LEVEL_LOG) --tests:$(NUMBER_OF_TESTS) --test_name:$(DYNAMIC_THIS_TEST) $($(DYNAMIC_THIS_TEST)_CTR_FILE)
endef

#
# Function for replacing spaces in source names
#
space :=
space += 
replaceSpaces = $(subst $(space),?,$1)

