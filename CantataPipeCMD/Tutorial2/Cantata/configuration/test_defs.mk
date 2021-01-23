#
# This file is auto generated and should not be modified
#

include ../configuration/$(CONFIG).mk
include ../configuration/build_defs.mk
include ../configuration/custom.mk

#
# Name of the test build and run rule
#
$(THIS_TEST)_BUILD_AND_RUN := $(THIS_TEST)/build_and_run

#
# Name of the run rule
#
$(THIS_TEST)_RUN := $(THIS_TEST)/run

#
# Name of rule for obtaining results
#
$(THIS_TEST)_GET_RESULT := $(THIS_TEST)/get_result

#
# Name of rule for the CTR file
#
$(THIS_TEST)_CTR_FILE := $(THIS_TEST)/$(THIS_TEST).ctr

#
# Name of the test executable
#
$(THIS_TEST)_TEST_EXE := $(THIS_TEST)/$(THIS_TEST)$(EXE_EXT)

#
# Options file dependency
#
$(THIS_TEST)_EXTRA_DEPENDS := $(EXTRA_DEPENDS)
$(THIS_TEST)_EXTRA_DEPENDS += $(THIS_TEST)/ipg.cop

#
# Objects
#
$(THIS_TEST)_TESTOBJ_FILENAMES := $(addsuffix $(OBJ_FILE_EXTS),$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_TESTOBJ)))
$(THIS_TEST)_SUTOBJ_FILENAMES := $(addsuffix $(OBJ_FILE_EXTS),$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_SUTOBJ)))

#
# CSI files
#
$(THIS_TEST)_TESTOBJ_CSI := $(addsuffix .csi,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_TESTOBJ)))
$(THIS_TEST)_SUTOBJ_CSI := $(addsuffix .csi,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_SUTOBJ)))

#
# Intermediate files
#
$(THIS_TEST)_TESTOBJ_CI := $(addsuffix .ci.*,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_TESTOBJ)))
$(THIS_TEST)_SUTOBJ_CI := $(addsuffix .ci.*,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_SUTOBJ)))
$(THIS_TEST)_TESTOBJ_SM := $(addsuffix .sm.*,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_TESTOBJ)))
$(THIS_TEST)_SUTOBJ_SM := $(addsuffix .sm.*,$(addprefix $(THIS_TEST)/,$($(THIS_TEST)_SUTOBJ)))

#
# Defines
#
$(THIS_TEST)_ALL_DEFINES := $(GLOBAL_DEFINES)
$(THIS_TEST)_ALL_DEFINES += $($(THIS_TEST)_DEFINES)
ifneq ($(TARGET_PROJECT_LOC),)
	$(THIS_TEST)_ALL_DEFINES += UT_OUTPUT_DIR=$(TARGET_PROJECT_LOC)/$(THIS_TEST)
endif

#
# Includes
#
$(THIS_TEST)_ALL_INCLUDES := $(GLOBAL_INCLUDES)
$(THIS_TEST)_ALL_INCLUDES += $($(THIS_TEST)_INCLUDES)

#
# Log files
#
$(THIS_TEST)_LOG := $(THIS_TEST).log

##
# RULES
##
# Define a dynamic version of THIS_TEST suitable for use in command bodies
# (Note that we can't use THIS_TEST itself because by the time the rules
# are processed THIS_TEST will have been changed by subsequent clients
# of this makefile. The setting of THIS_TEST to empty at the end of this
# file is designed to prevent incorrect uses slip through.)
DYNAMIC_THIS_TEST = $(firstword $(subst /, ,$(dir $@)))

$(THIS_TEST) : \
    $(THIS_TEST)/do_all ;

.PHONY : $(THIS_TEST)/do_all
$(THIS_TEST)/do_all : \
    $(THIS_TEST)/clean_build_output \
    $(THIS_TEST)/custom_pre_build \
    $(THIS_TEST)/print_banner \
    $(THIS_TEST)/make_test \
    $(THIS_TEST)/custom_post_build
	@$(ECHO_CMD_MED)

.PHONY : $(THIS_TEST)/print_banner
$(THIS_TEST)/print_banner :
	@$(ECHO_CMD_MED) Building $(DYNAMIC_THIS_TEST) ...

.PHONY : $(THIS_TEST)/clean_build_output
$(THIS_TEST)/clean_build_output :
	@-$(RM_CMD) $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)

#
# Link rules
#
$(THIS_TEST)_LINK_EXTLIBOPT = $(LIBRARY_OPT)
$(THIS_TEST)_ALL_EXTLIBS := $(GLOBAL_EXTLIBS)
$(THIS_TEST)_ALL_EXTLIBS += $($(THIS_TEST)_EXTLIBS)

# 
# Run test rule
#
.PHONY : $(THIS_TEST)/make_test
$(THIS_TEST)/make_test : 
	@$(MAKE) $($(DYNAMIC_THIS_TEST)_BUILD_AND_RUN) --warn-undefined-variables -s -k -f $(DYNAMIC_THIS_TEST)/test.mk

#
# Demultiplex output rule
#
.PHONY : $(THIS_TEST)/decode_results
$(THIS_TEST)/decode_results:
	$(DEMULT_CMD)

#
# Clean rule
#
.PHONY : $(THIS_TEST)/clean
$(THIS_TEST)/clean :
	$(CLEAN_CMD)

THIS_TEST :=

