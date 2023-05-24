set(CURRENT_DIR ${APOLLO_ROOT}/cyber/mainboard)

add_executable(mainboard 
    ${CURRENT_DIR}/mainboard.cc
    ${CURRENT_DIR}/module_argument.cc
    ${CURRENT_DIR}/module_controller.cc)

target_include_directories(mainboard PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(mainboard PUBLIC   cyber cyber_proto)
