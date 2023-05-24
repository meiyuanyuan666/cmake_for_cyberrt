
set(CURRENT_DIR ${APOLLO_ROOT}/cyber/proto)

include(${APOLLO_ROOT}/cmake/scripts/cc_proto_lib.cmake)

cc_proto_lib(cyber_proto_unit_test ${CURRENT_DIR}/unit_test.proto)
cc_proto_lib(cyber_proto_unit_test_3 ${CURRENT_DIR}/unit_test_pb3.proto)
cc_proto_lib(cyber_proto_classic_conf ${CURRENT_DIR}/classic_conf.proto)
cc_proto_lib(cyber_proto_choreography_conf ${CURRENT_DIR}/choreography_conf.proto)

set(deps  ":cyber_proto_classic_conf" ":cyber_proto_choreography_conf")
cc_proto_lib(cyber_proto_scheduler_conf ${CURRENT_DIR}/scheduler_conf.proto deps)

cc_proto_lib(cyber_proto_qos_profile ${CURRENT_DIR}/qos_profile.proto)

set(deps  ":cyber_proto_qos_profile")
cc_proto_lib(cyber_proto_role_attributes ${CURRENT_DIR}/role_attributes.proto deps)

set(deps  ":cyber_proto_role_attributes")
cc_proto_lib(cyber_proto_topology_change ${CURRENT_DIR}/topology_change.proto deps)

cc_proto_lib(cyber_proto_transport_conf ${CURRENT_DIR}/transport_conf.proto)
cc_proto_lib(cyber_proto_run_mode_conf ${CURRENT_DIR}/run_mode_conf.proto)
cc_proto_lib(cyber_proto_perf_conf ${CURRENT_DIR}/perf_conf.proto)

set(deps  ":cyber_proto_scheduler_conf" ":cyber_proto_transport_conf"
    ":cyber_proto_run_mode_conf" ":cyber_proto_perf_conf")
cc_proto_lib(cyber_proto_cyber_conf ${CURRENT_DIR}/cyber_conf.proto deps)

cc_proto_lib(cyber_proto_clock ${CURRENT_DIR}/clock.proto)

set(deps  ":cyber_proto_qos_profile")
cc_proto_lib(cyber_proto_component_conf ${CURRENT_DIR}/component_conf.proto deps)

set(deps  ":cyber_proto_component_conf")
cc_proto_lib(cyber_proto_dag_conf ${CURRENT_DIR}/dag_conf.proto deps)

cc_proto_lib(cyber_proto_parameter ${CURRENT_DIR}/parameter.proto)
cc_proto_lib(cyber_proto_proto_desc ${CURRENT_DIR}/proto_desc.proto)
cc_proto_lib(cyber_proto_record ${CURRENT_DIR}/record.proto)

add_library(cyber_proto SHARED 
    $<TARGET_OBJECTS:cyber_proto_unit_test>
    $<TARGET_OBJECTS:cyber_proto_unit_test_3>
    $<TARGET_OBJECTS:cyber_proto_classic_conf>
    $<TARGET_OBJECTS:cyber_proto_choreography_conf>
    $<TARGET_OBJECTS:cyber_proto_scheduler_conf>
    $<TARGET_OBJECTS:cyber_proto_qos_profile>
    $<TARGET_OBJECTS:cyber_proto_role_attributes>
    $<TARGET_OBJECTS:cyber_proto_topology_change>
    $<TARGET_OBJECTS:cyber_proto_transport_conf>
    $<TARGET_OBJECTS:cyber_proto_run_mode_conf>
    $<TARGET_OBJECTS:cyber_proto_perf_conf>
    $<TARGET_OBJECTS:cyber_proto_cyber_conf>
    $<TARGET_OBJECTS:cyber_proto_clock>
    $<TARGET_OBJECTS:cyber_proto_component_conf>
    $<TARGET_OBJECTS:cyber_proto_dag_conf>
    $<TARGET_OBJECTS:cyber_proto_parameter>
    $<TARGET_OBJECTS:cyber_proto_proto_desc>
    $<TARGET_OBJECTS:cyber_proto_record>
)

file(GLOB hdrs "${CURRENT_DIR}/*.proto")
install(FILES ${hdrs} DESTINATION cyber/proto)

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/proto)

unset(deps)
unset(CURRENT_DIR)
