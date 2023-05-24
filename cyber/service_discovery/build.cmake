set(CURRENT_DIR ${APOLLO_ROOT}/cyber/service_discovery)

set(cyber_service_discovery_srcs
    ${CURRENT_DIR}/topology_manager.cc
    ${CURRENT_DIR}/container/graph.cc
    ${CURRENT_DIR}/container/multi_value_warehouse.cc
    ${CURRENT_DIR}/container/single_value_warehouse.cc
    ${CURRENT_DIR}/role/role.cc
    ${CURRENT_DIR}/specific_manager/manager.cc
    ${CURRENT_DIR}/specific_manager/channel_manager.cc
    ${CURRENT_DIR}/specific_manager/node_manager.cc
    ${CURRENT_DIR}/specific_manager/service_manager.cc
    ${CURRENT_DIR}/communication/participant_listener.cc
    ${CURRENT_DIR}/communication/subscriber_listener.cc
    )


if(BUILD_TEST)
    add_executable(cyber_service_discovery_test 
        ${CURRENT_DIR}/topology_manager_test.cc
        ${CURRENT_DIR}/container/graph_test.cc
        ${CURRENT_DIR}/container/multi_value_warehouse_test.cc
        ${CURRENT_DIR}/container/single_value_warehouse_test.cc
        ${CURRENT_DIR}/role/role_test.cc
        ${CURRENT_DIR}/specific_manager/channel_manager_test.cc
        ${CURRENT_DIR}/specific_manager/node_manager_test.cc
        ${CURRENT_DIR}/specific_manager/service_manager_test.cc
            )
    target_include_directories(cyber_service_discovery_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_service_discovery_test   cyber cyber_proto
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/service_discovery)

file(GLOB hdrs "${CURRENT_DIR}/communication/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/communication)

file(GLOB hdrs "${CURRENT_DIR}/container/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/container)

file(GLOB hdrs "${CURRENT_DIR}/role/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/role)

file(GLOB hdrs "${CURRENT_DIR}/specific_manager/*.h")
install(FILES ${hdrs} DESTINATION cyber/scheduler/specific_manager)