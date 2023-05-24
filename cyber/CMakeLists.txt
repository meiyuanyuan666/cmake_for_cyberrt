

project(cyber VERSION 7.0
LANGUAGES C CXX ASM )

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


# 3.8.0
if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
  set(GTest_DIR /opt/libs-x64/gtest/lib/cmake/GTest)
  set(ENV{PKG_CONFIG_PATH} /opt/libs-x64/protobuf/protobuf-3.8.0/lib/pkgconfig)
  set(PROTOC_CMD /opt/libs-x64/protobuf/protobuf-3.8.0/bin/protoc CACHE STRING "protoc")
  set(glog_DIR /opt/libs-x64/glog/lib/cmake/glog)
  set(gflags_DIR /opt/libs-x64/gflags-dynamic/installed/x64-linux-dynamic/share/gflags)
  set(fastrtps_DIR /opt/libs-x64/fastrtps/lib/fastrtps/cmake)
  set(fastcdr_DIR /opt/libs-x64/fastcdr/lib/fastcdr/cmake)
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
  set(ENV{PKG_CONFIG_PATH} /opt/libs-aarch64/protobuf-3.12.3/lib/pkgconfig)
  set(PROTOC_CMD /opt/libs-aarch64/protobuf-3.12.3/bin/protoc CACHE STRING "protoc")
  set(GTest_DIR /opt/libs-aarch64/gtest/lib/cmake/GTest)
  set(glog_DIR /opt/libs-aarch64/glog-v0.4.0/lib/cmake/glog)
  set(gflags_DIR /opt/libs-aarch64/gflags-v2.2.0/lib/cmake/gflags)
  set(fastrtps_DIR /opt/libs-aarch64/fastrtps/lib/fastrtps/cmake)
  set(fastcdr_DIR /opt/libs-aarch64/fastcdr/lib/fastcdr/cmake)
endif()

find_package(PkgConfig REQUIRED)
pkg_search_module(PROTOBUF REQUIRED protobuf)
link_directories(${PROTOBUF_LIBDIR})
message("PROTOBUF_LIBDIR= ${PROTOBUF_LIBDIR}")
message("PROTOBUF_LIBRARIES ${PROTOBUF_LIBRARIES}")

find_package(GTest CONFIG REQUIRED)
find_package(glog CONFIG REQUIRED)
find_package(gflags  CONFIG REQUIRED)
find_package(OpenSSL REQUIRED)
find_package(fastcdr CONFIG REQUIRED)
find_package(fastrtps CONFIG REQUIRED)
# python dev env
set(Python_ADDITIONAL_VERSIONS 3.7)
find_package(PythonLibs)

include(build.cmake)
include(base/build.cmake)
include(blocker/build.cmake)
include(proto/build.cmake)
include(common/build.cmake)
include(class_loader/build.cmake)
include(component/build.cmake)
include(croutine/build.cmake)
include(data/build.cmake)
include(event/build.cmake)
include(io/build.cmake)
include(logger/build.cmake)
include(message/build.cmake)
include(node/build.cmake)
include(parameter/build.cmake)
include(record/build.cmake)
include(scheduler/build.cmake)
include(service/build.cmake)
include(service_discovery/build.cmake)
include(sysmo/build.cmake)
include(task/build.cmake)
include(time/build.cmake)
include(timer/build.cmake)
include(transport/build.cmake)
include(tools/build.cmake)
include(mainboard/build.cmake)
include(python/build.cmake)
include(examples/build.cmake)

add_library(cyber SHARED
  ${cyber_srcs}
  ${cyber_blocker_srcs}
  ${cyber_class_loader_srcs}
  ${cyber_common_srcs}
  ${cyber_component_srcs}
  ${cyber_croutine_srcs}
  ${cyber_event_srcs}
  ${cyber_io_srcs}
  ${cyber_logger_srcs}
  ${cyber_message_srcs}
  ${cyber_node_srcs}
  ${cyber_parameter_srcs}
  ${cyber_record_srcs}
  ${cyber_scheduler_srcs}
  ${cyber_service_discovery_srcs}
  ${cyber_sysmo_srcs}
  ${cyber_task_srcs}
  ${cyber_time_srcs}
  ${cyber_timer_srcs}
  ${cyber_transport_srcs}
  )

target_include_directories(cyber PUBLIC
  $<BUILD_INTERFACE:${APOLLO_ROOT}>
  $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
  $<INSTALL_INTERFACE:include/>)

target_link_libraries(cyber PUBLIC glog::glog gflags 
  fastrtps fastcdr atomic dl atomic uuid rt ${PROTOBUF_LIBRARIES})

# mainboard cyber_monitor cyber_recorder
install(TARGETS 
  cyber_proto  cyber mainboard cyber_monitor cyber_recorder
  EXPORT cyberTargets
  LIBRARY DESTINATION lib
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin)

file(GLOB hdrs "${APOLLO_ROOT}/cyber/conf/*")
install(FILES ${hdrs} DESTINATION cyber/conf)


include(CMakePackageConfigHelpers)
# generatte the version file 
write_basic_package_version_file(
  ${CMAKE_CURRENT_BINARY_DIR}/cyberConfigVersion.cmake
  VERSION ${PROJECT_VERSION}
  COMPATIBILITY SameMajorVersion
)

# export targets from the build tree
install(EXPORT cyberTargets
  DESTINATION "lib/cmake/cyber")

# create config file
configure_package_config_file(
  cyberConfig.cmake.in
  cyberConfig.cmake
  INSTALL_DESTINATION "lib/cmake/cyber"
)

# install config file 
install(FILES 
  ${CMAKE_CURRENT_BINARY_DIR}/cyberConfig.cmake
  ${CMAKE_CURRENT_BINARY_DIR}/cyberConfigVersion.cmake
  DESTINATION "lib/cmake/cyber"
)
