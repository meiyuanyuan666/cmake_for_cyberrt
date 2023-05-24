set(CURRENT_DIR ${APOLLO_ROOT}/cyber/python)

add_library(_cyber_wrapper SHARED 
    ${CURRENT_DIR}/internal/py_cyber.cc
    )
#   TODO: update lib deps test
target_include_directories(_cyber_wrapper PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(_cyber_wrapper PUBLIC 
    ${PYTHON_LIBRARY} cyber cyber_proto ) 
target_link_libraries(_cyber_wrapper PUBLIC glog::glog) 

add_library(_cyber_record_wrapper SHARED 
    ${CURRENT_DIR}/internal/py_record.cc
    )
target_include_directories(_cyber_record_wrapper PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(_cyber_record_wrapper PUBLIC 
    ${PYTHON_LIBRARY} cyber cyber_proto )

add_library(_cyber_time_wrapper SHARED 
    ${CURRENT_DIR}/internal/py_time.cc
    )
target_include_directories(_cyber_time_wrapper PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(_cyber_time_wrapper PUBLIC 
    ${PYTHON_LIBRARY} cyber cyber_proto  fastrtps)

add_library(_cyber_timer_wrapper SHARED 
    ${CURRENT_DIR}/internal/py_timer.cc
    )
target_include_directories(_cyber_timer_wrapper PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(_cyber_timer_wrapper PUBLIC 
    ${PYTHON_LIBRARY} cyber cyber_proto )


add_library(_cyber_parameter_wrapper SHARED 
    ${CURRENT_DIR}/internal/py_parameter.cc
    )
target_include_directories(_cyber_parameter_wrapper PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PYTHON_INCLUDE_DIR}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(_cyber_parameter_wrapper PUBLIC 
    ${PYTHON_LIBRARY} _cyber_wrapper cyber cyber_proto )

file(GLOB hdrs "${CURRENT_DIR}/cyber_py3/*.py")
install(FILES ${hdrs} DESTINATION cyber/python/cyber_py3)

install(TARGETS _cyber_wrapper _cyber_record_wrapper _cyber_time_wrapper
 _cyber_timer_wrapper _cyber_parameter_wrapper
  EXPORT cyberTargets
  LIBRARY DESTINATION cyber/python/internal
  ARCHIVE DESTINATION lib
  RUNTIME DESTINATION bin)