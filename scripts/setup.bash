#! /usr/bin/env bash
APOLLO_ROOT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd -P)"
HOST_ARCH="$(uname -m)"

source ${APOLLO_ROOT_DIR}/scripts/common.bashrc

export CYBER_PATH="${APOLLO_ROOT_DIR}/cyber"

pathprepend ${APOLLO_ROOT_DIR}/cyber/python/internal PYTHONPATH
pathprepend ${APOLLO_ROOT_DIR}/ PYTHONPATH

if [[ "${HOST_ARCH}" == "aarch64" ]]; then
    pathprepend /opt/libs-aarch64/fastrtps/lib  LD_LIBRARY_PATH
    pathprepend /opt/libs-aarch64/fastcdr/lib   LD_LIBRARY_PATH
    pathprepend /opt/libs-aarch64/gflags-v2.2.0/lib  LD_LIBRARY_PATH
    pathprepend /opt/libs-aarch64/glog-v0.4.0/lib   LD_LIBRARY_PATH
    pathprepend /opt/libs-aarch64/protobuf-3.12.3/lib   LD_LIBRARY_PATH
else ## x86_64 mode
    pathprepend /opt/libs-x64/fastrtps/lib  LD_LIBRARY_PATH
    pathprepend /opt/libs-x64/fastcdr/lib   LD_LIBRARY_PATH
    pathprepend /opt/libs-x64/gflags/lib  LD_LIBRARY_PATH
    pathprepend /opt/libs-x64/glog/lib   LD_LIBRARY_PATH
    pathprepend /opt/libs-x64/protobuf/protobuf-3.8.0/lib   LD_LIBRARY_PATH
    pathprepend /opt/libs-x64/gtest/lib   LD_LIBRARY_PATH
fi

pathprepend ${APOLLO_ROOT_DIR}/bin PATH
pathprepend ${APOLLO_ROOT_DIR}/lib  LD_LIBRARY_PATH


export CYBER_DOMAIN_ID=80
export CYBER_IP=127.0.0.1

export GLOG_log_dir="${APOLLO_ROOT_DIR}/data/log"
export GLOG_alsologtostderr=0
export GLOG_colorlogtostderr=1
export GLOG_minloglevel=0

export sysmo_start=0

# for DEBUG log
export GLOG_v=4

source ${APOLLO_ROOT_DIR}/scripts/cyber_tools_auto_complete.bash
