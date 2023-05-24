set(CURRENT_DIR ${APOLLO_ROOT}/cyber/parameter)

set(cyber_parameter_srcs 
    ${CURRENT_DIR}/parameter.cc
    ${CURRENT_DIR}/parameter_client.cc
    ${CURRENT_DIR}/parameter_server.cc
    )

if(BUILD_TEST)
    add_executable(cyber_param_test 
        ${CURRENT_DIR}/parameter_client_test.cc
        ${CURRENT_DIR}/parameter_server_test.cc
        ${CURRENT_DIR}/parameter_test.cc
         )
    target_include_directories(cyber_param_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_param_test   cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/parameter)