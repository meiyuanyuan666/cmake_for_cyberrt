set(CURRENT_DIR ${APOLLO_ROOT}/cyber/scheduler)

set(cyber_scheduler_srcs
    ${CURRENT_DIR}/processor.cc
    ${CURRENT_DIR}/processor_context.cc
    ${CURRENT_DIR}/scheduler.cc
    ${CURRENT_DIR}/common/pin_thread.cc
    ${CURRENT_DIR}/scheduler_factory.cc
    ${CURRENT_DIR}/policy/scheduler_choreography.cc
    ${CURRENT_DIR}/policy/scheduler_classic.cc
    ${CURRENT_DIR}/policy/choreography_context.cc
    ${CURRENT_DIR}/policy/classic_context.cc
    )

if(BUILD_TEST)
add_executable(cyber_scheduler_test 
    # ${CURRENT_DIR}/scheduler_classic_test.cc
    # ${CURRENT_DIR}/scheduler_choreo_test.cc  # 用例有冲突,不能与下列同时编译
    ${CURRENT_DIR}/scheduler_test.cc
    ${CURRENT_DIR}/processor_test.cc
    ${CURRENT_DIR}/common/pin_thread_test.cc
        )
target_include_directories(cyber_scheduler_test PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_scheduler_test   cyber cyber_proto
    GTest::gtest_main pthread)

add_executable(cyber_scheduler_classic_test
    ${CURRENT_DIR}/scheduler_classic_test.cc
        )
target_include_directories(cyber_scheduler_classic_test PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_scheduler_classic_test   cyber cyber_proto
    GTest::gtest_main pthread)

add_executable(cyber_scheduler_choreo_test
    ${CURRENT_DIR}/scheduler_choreo_test.cc
        )
target_include_directories(cyber_scheduler_choreo_test PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_scheduler_choreo_test   cyber cyber_proto
    GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler)

file(GLOB hdrs "${CURRENT_DIR}/common/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/common)

file(GLOB hdrs "${CURRENT_DIR}/policy/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/policy)