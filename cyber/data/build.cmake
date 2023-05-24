set(CURRENT_DIR ${APOLLO_ROOT}/cyber/data)

if(BUILD_TEST)
    add_executable(cyber_data_test 
        ${CURRENT_DIR}/cache_buffer_test.cc
        ${CURRENT_DIR}/channel_buffer_test.cc
        ${CURRENT_DIR}/data_dispatcher_test.cc
        ${CURRENT_DIR}/fusion/all_latest_test.cc
        ${CURRENT_DIR}/data_visitor_test.cc
        )
    target_include_directories(cyber_data_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_data_test   cyber cyber_proto
        GTest::gtest GTest::gtest_main fastrtps pthread)
endif()


file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/data)

file(GLOB hdrs "${CURRENT_DIR}/fusion/*.h")
install(FILES ${hdrs} DESTINATION cyber/data/fusion)