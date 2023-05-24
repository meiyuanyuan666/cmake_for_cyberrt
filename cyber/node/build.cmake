set(CURRENT_DIR ${APOLLO_ROOT}/cyber/node)

set(cyber_node_srcs
    ${CURRENT_DIR}/node.cc
    )

if(BUILD_TEST)
    add_executable(cyber_node_test 
        ${CURRENT_DIR}/node_channel_impl_test.cc
        ${CURRENT_DIR}/node_test.cc
        ${CURRENT_DIR}/reader_test.cc
        ${CURRENT_DIR}/writer_reader_test.cc
        ${CURRENT_DIR}/writer_test.cc
         )
    target_include_directories(cyber_node_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_node_test PUBLIC cyber cyber_proto
        GTest::gtest pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/node)