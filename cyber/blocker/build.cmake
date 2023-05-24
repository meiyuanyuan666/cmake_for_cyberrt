set(CURRENT_DIR ${APOLLO_ROOT}/cyber/blocker)

set(cyber_blocker_srcs ${CURRENT_DIR}/blocker_manager.cc)

if(BUILD_TEST)
    # blocker_manager test
    add_executable(cyber_blocker_manager_test 
        ${CURRENT_DIR}/blocker_manager_test.cc
        ${CURRENT_DIR}/blocker_test.cc
        ${CURRENT_DIR}/../common/log_test.cc
        ${CURRENT_DIR}/../common/environment_test.cc
        ${CURRENT_DIR}/../common/macros_test.cc
        ${CURRENT_DIR}/../common/file_test.cc
        )
    target_link_libraries(cyber_blocker_manager_test  
    cyber_proto  cyber  glog::glog  GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/blocker)

unset(CURRENT_DIR)