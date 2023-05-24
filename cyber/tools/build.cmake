set(CURRENT_DIR ${APOLLO_ROOT}/cyber/tools)

add_executable(cyber_monitor 
    ${CURRENT_DIR}/cyber_monitor/cyber_topology_message.cc
    ${CURRENT_DIR}/cyber_monitor/general_channel_message.cc
    ${CURRENT_DIR}/cyber_monitor/general_message.cc
    ${CURRENT_DIR}/cyber_monitor/general_message_base.cc
    ${CURRENT_DIR}/cyber_monitor/main.cc
    ${CURRENT_DIR}/cyber_monitor/renderable_message.cc
    ${CURRENT_DIR}/cyber_monitor/screen.cc
    )
target_include_directories(cyber_monitor PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_monitor PUBLIC 
    cyber cyber_proto pthread ncurses)

add_executable(cyber_recorder 
    ${CURRENT_DIR}/cyber_recorder/info.cc
    ${CURRENT_DIR}/cyber_recorder/main.cc
    ${CURRENT_DIR}/cyber_recorder/recorder.cc
    ${CURRENT_DIR}/cyber_recorder/recoverer.cc
    ${CURRENT_DIR}/cyber_recorder/spliter.cc
    ${CURRENT_DIR}/cyber_recorder/player/play_task_buffer.cc
    ${CURRENT_DIR}/cyber_recorder/player/play_task_consumer.cc
    ${CURRENT_DIR}/cyber_recorder/player/play_task_producer.cc
    ${CURRENT_DIR}/cyber_recorder/player/play_task.cc
    ${CURRENT_DIR}/cyber_recorder/player/player.cc
    )
target_include_directories(cyber_recorder PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_recorder PUBLIC 
    cyber cyber_proto  pthread ncurses)

file(GLOB hdrs "${CURRENT_DIR}/cyber_channel/*.py")
install(FILES ${hdrs} DESTINATION bin)
file(GLOB hdrs "${CURRENT_DIR}/cyber_launch/*.py")
install(FILES ${hdrs} DESTINATION bin)
file(GLOB hdrs "${CURRENT_DIR}/cyber_node/*.py")
install(FILES ${hdrs} DESTINATION bin)
file(GLOB hdrs "${CURRENT_DIR}/cyber_service/*.py")
install(FILES ${hdrs} DESTINATION bin)