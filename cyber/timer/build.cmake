set(CURRENT_DIR ${APOLLO_ROOT}/cyber/timer)

set(cyber_timer_srcs 
    ${CURRENT_DIR}/timer.cc
    ${CURRENT_DIR}/timing_wheel.cc
    )

if(BUILD_TEST)
    add_executable(cyber_timer_test 
        ${CURRENT_DIR}/timer_test.cc
        )
    target_include_directories(cyber_timer_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_timer_test PUBLIC cyber cyber_proto 
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/timer)