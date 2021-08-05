#
# Cantata tool configuration definitions
# Modifying this file may cause errors when building Cantata tests
# Generated from Cantata configuration section: x86_64-Linux-5.4.0-65-generic-gcc7.5.0_c11

#
# Test execution related options
#
BUILD_PREFIX := 
REDIRECT_OUTPUT := 1
MKDIR_CMD := mkdir 
ECHO_CMD := echo 
RM_CMD := rm -f 
EXE_EXT := .exe
EXECUTE_CMD := cd %DIR% ; ../%TEST_EXE%
CANTPP_CMD := cppccd -F %COP% --intdir:%DIR% 
JAVA_CMD := java
ifdef JAVA_HOME
JAVA_CMD := "$(subst \,/,$(JAVA_HOME))/bin/java"
endif
ifdef CANTATA_JAVA_HOME
JAVA_CMD := "$(subst \,/,$(CANTATA_JAVA_HOME))/bin/java"
endif
ifndef CANTATA_INSTALL_DIR
CANTATA_INSTALL_DIR := /opt/qa_systems/cantata
export CANTATA_INSTALL_DIR
endif

#
# Global flags, includes and libraries
#
GLOBAL_DEFINES := 
GLOBAL_INCLUDES := 
GLOBAL_EXTLIBS := 
DEBUG_FLAGS := 
C_LINK_FINALOPTS := 
CPP_LINK_FINALOPTS := 
CTR_STATE := ctr_state
# Set to 1 to escape arguments starting with forward slashes (0 otherwise)
USE_ESCAPED_SLASHES := 0

#
# Compiler specific options
#
DEFAULT_COMPILER_NAME := gcc
ifeq ($(USE_ESCAPED_SLASHES),1)
    ORIGINAL_DEFAULT_COMPILER_OPTS := -c %f -o %o
    DEFAULT_COMPILER_OPTS := $(patsubst /%,//%,$(ORIGINAL_DEFAULT_COMPILER_OPTS))
    ORIGINAL_DEFAULT_LINKER_OPTS := %f -o %o
    DEFAULT_LINKER_OPTS := $(patsubst /%,//%,$(ORIGINAL_DEFAULT_LINKER_OPTS))
    ORIGINAL_DEFINE_OPT := -D
    DEFINE_OPT := $(patsubst /%,//%,$(ORIGINAL_DEFINE_OPT))
    ORIGINAL_LIBRARY_OPT := -l%s
    LIBRARY_OPT := $(patsubst /%,//%,$(ORIGINAL_LIBRARY_OPT))
    ORIGINAL_INCLUDE_PATH_OPT := -I%s
    INCLUDE_PATH_OPT := $(patsubst /%,//%,$(ORIGINAL_INCLUDE_PATH_OPT))
else
    DEFAULT_COMPILER_OPTS := -c %f -o %o
    DEFAULT_LINKER_OPTS := %f -o %o
    DEFINE_OPT := -D
    LIBRARY_OPT := -l%s
    INCLUDE_PATH_OPT := -I%s
endif
DEFAULT_LINKER_NAME := gcc
OBJ_FILE_EXTS := .o
MULTIPLEXED_OUTPUT := 0

#
# Top level log file
#
export CANTPP_TOP_LEVEL_LOG := make_log.dat

#
# Source file extensions
#
export SOURCE_FILE_EXTS := .c .C .wfc .WFC .Wfc 

#
# Extra dependency on this file (used in test makefiles)
#

EXTRA_DEPENDS := ../configuration/x86_64-Linux-5.4.0-65-generic-gcc7.5.0_c11.mk