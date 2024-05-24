# Sources
file(GLOB HALIDEPassSrc "*.cpp")


# Compilation flags
set_source_files_properties(${HALIDEPassSrc} PROPERTIES COMPILE_FLAGS " -std=c++2a")

# Name of the LLVM pass
set(HALIDEPassName "HALIDE")

# configure LLVM 
find_package(LLVM REQUIRED CONFIG)

set(LLVM_RUNTIME_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/)
set(LLVM_LIBRARY_OUTPUT_INTDIR ${CMAKE_BINARY_DIR}/${CMAKE_CFG_INTDIR}/)

list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include(HandleLLVMOptions)
include(AddLLVM)

message(STATUS "LLVM_DIR IS ${LLVM_CMAKE_DIR}.")

# add llvm and noelle 
include_directories(${LLVM_INCLUDE_DIRS})
include_directories(${LLVM_INCLUDE_DIRS} /home/tht5102/snoelle/install/include)

# Declare the LLVM pass to compile
add_llvm_library(${HALIDEPassName} MODULE ${HALIDEPassSrc})
