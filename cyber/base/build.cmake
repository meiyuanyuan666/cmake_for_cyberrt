set(CURRENT_DIR ${APOLLO_ROOT}/cyber/base)

if(BUILD_TEST)
    add_executable(cyber_base_test 
        ${CURRENT_DIR}/atomic_hash_map_test.cc
        ${CURRENT_DIR}/atomic_rw_lock_test.cc
        ${CURRENT_DIR}/bounded_queue_test.cc
        ${CURRENT_DIR}/for_each_test.cc
        ${CURRENT_DIR}/object_pool_test.cc
        ${CURRENT_DIR}/signal_test.cc
        ${CURRENT_DIR}/unbounded_queue_test.cc)
    target_link_libraries(cyber_base_test cyber_proto  cyber  GTest::gtest pthread GTest::gtest_main)
endif()

file(GLOB base_hdrs "${CURRENT_DIR}/*.h")
install(FILES ${base_hdrs} DESTINATION cyber/base)

unset(CURRENT_DIR)