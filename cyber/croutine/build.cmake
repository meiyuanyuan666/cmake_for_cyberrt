set(CURRENT_DIR ${APOLLO_ROOT}/cyber/croutine)

if(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64")
    set(_swap_source ${CURRENT_DIR}/detail/swap_x86_64.S)
elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64")
    set(_swap_source ${CURRENT_DIR}/detail/swap_aarch64.S)
endif()

set(cyber_croutine_srcs 
    ${_swap_source}
    ${CURRENT_DIR}/detail/routine_context.cc
    ${CURRENT_DIR}/croutine.cc)

if(BUILD_TEST)
    add_executable(cyber_croutine_test ${CURRENT_DIR}/croutine_test.cc)
    target_include_directories(cyber_croutine_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_croutine_test  cyber  cyber_proto
        GTest::gtest pthread GTest::gtest_main protobuf fastrtps)
endif()


file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/croutine)

file(GLOB hdrs "${CURRENT_DIR}/detail/*.h")
install(FILES ${hdrs} DESTINATION cyber/croutine/detail)