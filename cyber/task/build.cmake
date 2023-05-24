set(CURRENT_DIR ${APOLLO_ROOT}/cyber/task)

set(cyber_task_srcs
    ${CURRENT_DIR}/task_manager.cc
    )
# target_compile_options(cyber_task PRIVATE "-faligned-new")

if(BUILD_TEST)
    add_executable(cyber_task_test 
        ${CURRENT_DIR}/task_test.cc
        )
    target_include_directories(cyber_task_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_task_test PUBLIC cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/task)