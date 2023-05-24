set(CURRENT_DIR ${APOLLO_ROOT}/cyber/component)

set(cyber_component_srcs 
    ${CURRENT_DIR}/timer_component.cc)

if(BUILD_TEST)
    #  unit test
    add_executable(cyber_component_test 
        ${CURRENT_DIR}/timer_component_test.cc)
    target_include_directories(cyber_component_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_component_test PUBLIC 
    cyber cyber_proto GTest::gtest GTest::gtest_main fastrtps)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/component)

unset(CURRENT_DIR)