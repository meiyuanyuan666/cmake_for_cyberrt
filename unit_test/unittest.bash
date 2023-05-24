
dir=$1
echo "start unit test in ${dir}"

${dir}/cyber/cyber_base_test

${dir}/cyber/cyber_blocker_manager_test

${dir}/cyber/cyber_common_test

${dir}/cyber/cyber_class_loader_test

${dir}/cyber/cyber_component_test

${dir}/cyber/cyber_croutine_test

${dir}/cyber/cyber_data_test

${dir}/cyber/cyber_logger_test

${dir}/cyber/cyber_message_test

${dir}/cyber/cyber_node_test 

${dir}/cyber/cyber_param_test

${dir}/cyber/cyber_record_test

${dir}/cyber/cyber_scheduler_test

${dir}/cyber/cyber_service_discovery_test

${dir}/cyber/cyber_sysmo_test

${dir}/cyber/cyber_task_test

${dir}/cyber/cyber_time_test

${dir}/cyber/cyber_timer_test

${dir}/cyber/cyber_transport_test

${dir}/cyber/cyber_scheduler_classic_test

${dir}/cyber/cyber_scheduler_choreo_test