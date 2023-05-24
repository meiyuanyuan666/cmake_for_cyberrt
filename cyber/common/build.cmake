set(CURRENT_DIR ${APOLLO_ROOT}/cyber/common)

set(cyber_common_srcs 
    ${CURRENT_DIR}/global_data.cc
    ${CURRENT_DIR}/file.cc)

if(BUILD_TEST)
    # file_test unit test
    add_executable(cyber_common_test 
        ${CURRENT_DIR}/file_test.cc
        ${CURRENT_DIR}/log_test.cc
        ${CURRENT_DIR}/environment_test.cc
        ${CURRENT_DIR}/macros_test.cc
        )
    target_include_directories(cyber_common_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_common_test PUBLIC 
        cyber cyber_proto  GTest::gtest_main glog::glog gflags 
        fastrtps fastcdr atomic ${PROTOBUF_LIBRARIES})
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/common)

unset(CURRENT_DIR)