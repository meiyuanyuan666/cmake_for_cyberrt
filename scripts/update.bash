#! /usr/bin/env bash

APOLLO_ROOT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd -P)"

protoc --python_out=${APOLLO_ROOT_DIR}/ --proto_path=${APOLLO_ROOT_DIR}/ ${APOLLO_ROOT_DIR}/cyber/proto/*.proto

chmod a+x ${APOLLO_ROOT_DIR}/bin/cyber_channel.py
chmod a+x ${APOLLO_ROOT_DIR}/bin/cyber_launch.py
chmod a+x ${APOLLO_ROOT_DIR}/bin/cyber_node.py
chmod a+x ${APOLLO_ROOT_DIR}/bin/cyber_service.py

ln -sf ${APOLLO_ROOT_DIR}/bin/cyber_channel.py ${APOLLO_ROOT_DIR}/bin/cyber_channel
ln -sf ${APOLLO_ROOT_DIR}/bin/cyber_launch.py ${APOLLO_ROOT_DIR}/bin/cyber_launch
ln -sf ${APOLLO_ROOT_DIR}/bin/cyber_node.py ${APOLLO_ROOT_DIR}/bin/cyber_node
ln -sf ${APOLLO_ROOT_DIR}/bin/cyber_service.py ${APOLLO_ROOT_DIR}/bin/cyber_service

ln -sf ${APOLLO_ROOT_DIR}/cyber/python/internal/lib_cyber_parameter_wrapper.so ${APOLLO_ROOT_DIR}/cyber/python/internal/_cyber_parameter_wrapper.so
ln -sf ${APOLLO_ROOT_DIR}/cyber/python/internal/lib_cyber_record_wrapper.so ${APOLLO_ROOT_DIR}/cyber/python/internal/_cyber_record_wrapper.so
ln -sf ${APOLLO_ROOT_DIR}/cyber/python/internal/lib_cyber_timer_wrapper.so ${APOLLO_ROOT_DIR}/cyber/python/internal/_cyber_timer_wrapper.so
ln -sf ${APOLLO_ROOT_DIR}/cyber/python/internal/lib_cyber_time_wrapper.so ${APOLLO_ROOT_DIR}/cyber/python/internal/_cyber_time_wrapper.so
ln -sf ${APOLLO_ROOT_DIR}/cyber/python/internal/lib_cyber_wrapper.so ${APOLLO_ROOT_DIR}/cyber/python/internal/_cyber_wrapper.so