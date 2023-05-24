set(CURRENT_DIR ${APOLLO_ROOT}/cyber/time)

set(cyber_time_srcs 
    ${CURRENT_DIR}/time.cc
    ${CURRENT_DIR}/rate.cc
    ${CURRENT_DIR}/duration.cc
    ${CURRENT_DIR}/clock.cc
)

if(BUILD_TEST)
    add_executable(cyber_time_test 
        ${CURRENT_DIR}/time_test.cc
        ${CURRENT_DIR}/duration_test.cc
        ${CURRENT_DIR}/clock_test.cc
        )
    target_include_directories(cyber_time_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_time_test PUBLIC cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/time)