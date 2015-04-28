# Copyright (C) 2014-2015 ARM Limited. All rights reserved. 

if(TARGET_FRDM_K64F_GCC_TOOLCHAIN_INCLUDED)
    return()
endif()
set(TARGET_FRDM_K64F_GCC_TOOLCHAIN_INCLUDED 1)

# provide compatibility definitions for compiling with this target: these are
# definitions that legacy code assumes will be defined. Before adding something
# here, think VERY CAREFULLY if you can't change anywhere that relies on the
# definition that you're about to add to rely on the TARGET_LIKE_XXX
# definitions that yotta provides based on the target.json file.
#
set(YOTTA_TARGET_DEFINITIONS "-DCPU_MK64FN1M0VMD12 -DTARGET_K64F -DTOOLCHAIN_GCC -DTOOLCHAIN_GCC_ARM -DMBED_OPERATORS")

# append non-generic flags, and set K64F-specific link script

set(_CPU_COMPILATION_OPTIONS "-mcpu=cortex-m4 -mthumb -D__thumb2__")

set(CMAKE_C_FLAGS_INIT             "${CMAKE_C_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_ASM_FLAGS_INIT           "${CMAKE_ASM_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_CXX_FLAGS_INIT           "${CMAKE_CXX_FLAGS_INIT} ${_CPU_COMPILATION_OPTIONS}")
set(CMAKE_MODULE_LINKER_FLAGS_INIT "${CMAKE_MODULE_LINKER_FLAGS_INIT} -mcpu=cortex-m4 -mthumb")
set(CMAKE_EXE_LINKER_FLAGS_INIT    "${CMAKE_EXE_LINKER_FLAGS_INIT} -mcpu=cortex-m4 -mthumb -T${CMAKE_CURRENT_LIST_DIR}/../ld/K64FN1M0xxx12.ld") 

message("CMAKE_EXE_LINKER_FLAGS_INIT (tl): ${CMAKE_EXE_LINKER_FLAGS_INIT}")
message("CMAKE_EXE_LINKER_FLAGS (tl): ${CMAKE_EXE_LINKER_FLAGS}")

