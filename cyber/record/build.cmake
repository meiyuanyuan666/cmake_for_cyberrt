set(CURRENT_DIR ${APOLLO_ROOT}/cyber/record)

set(cyber_record_srcs 
    ${CURRENT_DIR}/header_builder.cc
    ${CURRENT_DIR}/record_reader.cc
    ${CURRENT_DIR}/file/record_file_base.cc
    ${CURRENT_DIR}/file/record_file_reader.cc
    ${CURRENT_DIR}/file/record_file_writer.cc
    ${CURRENT_DIR}/record_viewer.cc
    ${CURRENT_DIR}/record_writer.cc
    )

if(BUILD_TEST)
add_executable(cyber_record_test 
    ${CURRENT_DIR}/file/record_file_test.cc
    ${CURRENT_DIR}/file/record_file_integration_test.cc
    ${CURRENT_DIR}/record_reader_test.cc
    ${CURRENT_DIR}/record_viewer_test.cc
     )
target_include_directories(cyber_record_test PUBLIC 
    $<BUILD_INTERFACE:${APOLLO_ROOT}>
    $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
    $<INSTALL_INTERFACE:include/>)
target_link_libraries(cyber_record_test   cyber cyber_proto
    GTest::gtest pthread)
endif()

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/record)

file(GLOB hdrs "${CURRENT_DIR}/file/*.h")
install(FILES ${hdrs} DESTINATION cyber/record/file)