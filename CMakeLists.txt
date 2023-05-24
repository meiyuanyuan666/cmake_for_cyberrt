cmake_minimum_required(VERSION 3.10)

# set(VCPKG_TARGET_TRIPLET "x64-linux-dynamic" CACHE STRING "")
# set(VCPKG_ROOT "/home/zz/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE PATH "")
# set(CMAKE_TOOLCHAIN_FILE ${VCPKG_ROOT} CACHE STRING "")

project(framework)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 11)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

# get apollo source dir
if(NOT DEFINED APOLLO_ROOT)
    message("APOLLO_ROOT not defined")
    get_filename_component(APOLLO_ROOT ${CMAKE_CURRENT_SOURCE_DIR} PATH CACHE PATH "APOLLO_ROOT dir")
else()
    message("APOLLO_ROOT defined: ${APOLLO_ROOT}")
    get_filename_component(APOLLO_ROOT ${APOLLO_ROOT} ABSOLUTE CACHE PATH "APOLLO_ROOT dir")
endif()
message("APOLLO_ROOT : ${APOLLO_ROOT}")

add_subdirectory(cyber)

install(FILES
  scripts/setup.bash
  scripts/common.bashrc
  scripts/cyber_tools_auto_complete.bash
  scripts/update.bash
  DESTINATION  scripts) 
