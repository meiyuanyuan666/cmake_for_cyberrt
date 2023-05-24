set(CURRENT_DIR ${APOLLO_ROOT}/cyber/message)

set(cyber_message_srcs 
    ${CURRENT_DIR}/protobuf_factory.cc
    )

if(BUILD_TEST)
    add_executable(cyber_message_test 
        ${CURRENT_DIR}/message_header_test.cc
        ${CURRENT_DIR}/message_traits_test.cc
        ${CURRENT_DIR}/protobuf_factory_test.cc
        ${CURRENT_DIR}/raw_message_test.cc
         )
    target_include_directories(cyber_message_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_message_test   cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/message)