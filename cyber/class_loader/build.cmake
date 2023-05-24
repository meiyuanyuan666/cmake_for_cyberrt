set(CURRENT_DIR ${APOLLO_ROOT}/cyber/class_loader)

set(cyber_class_loader_srcs 
    ${CURRENT_DIR}/shared_library/shared_library.cc
    ${CURRENT_DIR}/class_loader.cc
    ${CURRENT_DIR}/class_loader_manager.cc
    ${CURRENT_DIR}/utility/class_factory.cc
    ${CURRENT_DIR}/utility/class_loader_utility.cc)

if(BUILD_TEST)
    # libsample
    add_library(cyber_shared_library_sample SHARED
        ${CURRENT_DIR}/shared_library/sample.cc)
    target_include_directories(cyber_shared_library_sample PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_shared_library_sample PUBLIC cyber cyber_proto dl m)

    # unit test
    add_executable(cyber_shared_library_sample_test 
        ${CURRENT_DIR}/shared_library/shared_library_test.cc)
    target_include_directories(cyber_shared_library_sample_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_shared_library_sample_test PUBLIC 
        cyber_shared_library_sample GTest::gtest pthread GTest::gtest_main)

    add_library(plugin1 SHARED ${CURRENT_DIR}/test/plugin1.cc)
    target_include_directories(plugin1 PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(plugin1 PUBLIC dl m cyber cyber_proto  glog::glog)

    add_library(plugin2 SHARED ${CURRENT_DIR}/test/plugin2.cc)
    target_include_directories(plugin2 PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(plugin2 PUBLIC dl m cyber cyber_proto  glog::glog)
    
    # class_loader_test unit test
    add_executable(cyber_class_loader_test 
        ${CURRENT_DIR}/class_loader_test.cc)
    target_include_directories(cyber_class_loader_test PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<INSTALL_INTERFACE:include/>)
    target_link_libraries(cyber_class_loader_test PUBLIC 
        cyber cyber_proto GTest::gtest pthread glog::glog dl m )
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/class_loader)
file(GLOB hdrs "${CURRENT_DIR}/utility/*.h")
install(FILES ${hdrs} DESTINATION cyber/class_loader/utility)
file(GLOB hdrs "${CURRENT_DIR}/shared_library/*.h")
install(FILES ${hdrs} DESTINATION cyber/class_loader/shared_library)

unset(CURRENT_DIR)