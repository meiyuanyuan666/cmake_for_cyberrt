set(CURRENT_DIR ${APOLLO_ROOT}/cyber/transport)

set(cyber_transport_srcs
    ${CURRENT_DIR}/transport.cc
    ${CURRENT_DIR}/common/endpoint.cc
    ${CURRENT_DIR}/common/identity.cc
    ${CURRENT_DIR}/dispatcher/dispatcher.cc
    ${CURRENT_DIR}/dispatcher/intra_dispatcher.cc
    ${CURRENT_DIR}/dispatcher/rtps_dispatcher.cc
    ${CURRENT_DIR}/dispatcher/shm_dispatcher.cc
    ${CURRENT_DIR}/message/message_info.cc
    ${CURRENT_DIR}/qos/qos_profile_conf
    ${CURRENT_DIR}/rtps/attributes_filler.cc
    ${CURRENT_DIR}/rtps/participant.cc
    ${CURRENT_DIR}/rtps/sub_listener.cc
    ${CURRENT_DIR}/rtps/underlay_message_type.cc
    ${CURRENT_DIR}/rtps/underlay_message.cc
    ${CURRENT_DIR}/shm/block.cc
    ${CURRENT_DIR}/shm/condition_notifier.cc
    ${CURRENT_DIR}/shm/multicast_notifier.cc
    ${CURRENT_DIR}/shm/notifier_factory.cc
    ${CURRENT_DIR}/shm/posix_segment.cc
    ${CURRENT_DIR}/shm/readable_info.cc
    ${CURRENT_DIR}/shm/segment_factory.cc
    ${CURRENT_DIR}/shm/segment.cc
    ${CURRENT_DIR}/shm/shm_conf.cc
    ${CURRENT_DIR}/shm/state.cc
    ${CURRENT_DIR}/shm/xsi_segment.cc
    )


if(BUILD_TEST)
    add_executable(cyber_transport_test 
        ${CURRENT_DIR}/transport_test.cc
        )
    target_include_directories(cyber_transport_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_transport_test cyber_proto  cyber 
        GTest::gtest_main pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport)

file(GLOB hdrs "${CURRENT_DIR}/common/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/common)

file(GLOB hdrs "${CURRENT_DIR}/dispatcher/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/dispatcher)

file(GLOB hdrs "${CURRENT_DIR}/message/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/message)

file(GLOB hdrs "${CURRENT_DIR}/qos/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/qos)

file(GLOB hdrs "${CURRENT_DIR}/rtps/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/rtps)

file(GLOB hdrs "${CURRENT_DIR}/shm/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/shm)

file(GLOB hdrs "${CURRENT_DIR}/receiver/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/receiver)

file(GLOB hdrs "${CURRENT_DIR}/transmitter/*.h")
install(FILES ${hdrs} DESTINATION cyber/transport/transmitter)