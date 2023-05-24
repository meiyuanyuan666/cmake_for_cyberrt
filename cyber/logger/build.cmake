set(CURRENT_DIR ${APOLLO_ROOT}/cyber/logger)

set(cyber_logger_srcs 
    ${CURRENT_DIR}/async_logger.cc
    ${CURRENT_DIR}/log_file_object.cc
    ${CURRENT_DIR}/logger_util.cc
    ${CURRENT_DIR}/logger.cc)

if(BUILD_TEST)
    add_executable(cyber_logger_test 
        ${CURRENT_DIR}/async_logger_test.cc
        ${CURRENT_DIR}/log_file_object_test.cc
        ${CURRENT_DIR}/logger_util_test.cc
         )
    target_include_directories(cyber_logger_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_logger_test   cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/logger)