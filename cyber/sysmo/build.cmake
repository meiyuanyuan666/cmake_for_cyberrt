set(CURRENT_DIR ${APOLLO_ROOT}/cyber/sysmo)

set(cyber_sysmo_srcs 
    ${CURRENT_DIR}/sysmo.cc
    )


if(BUILD_TEST)
    add_executable(cyber_sysmo_test 
        ${CURRENT_DIR}/sysmo_test.cc
        )
    target_include_directories(cyber_sysmo_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_sysmo_test PUBLIC  cyber cyber_proto
        GTest::gtest_main pthread)
endif()


file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/sysmo)
