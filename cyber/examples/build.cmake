set(CURRENT_DIR ${APOLLO_ROOT}/cyber/examples/proto)
cc_proto_lib(examples_proto ${CURRENT_DIR}/examples.proto)

add_library(cyber_examples_proto SHARED 
    $<TARGET_OBJECTS:examples_proto>)

set(CURRENT_DIR ${APOLLO_ROOT}/cyber/examples)

add_executable(talker 
    ${CURRENT_DIR}/talker.cc
    )

target_include_directories(talker PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(talker PUBLIC   cyber cyber_proto cyber_examples_proto)


add_executable(listener 
    ${CURRENT_DIR}/listener.cc
    )

target_include_directories(listener PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(listener PUBLIC   cyber cyber_proto cyber_examples_proto)