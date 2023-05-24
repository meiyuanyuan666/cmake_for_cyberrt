set(CURRENT_DIR ${APOLLO_ROOT}/cyber/io)

set(cyber_io_srcs 
    ${CURRENT_DIR}/poll_handler.cc
    ${CURRENT_DIR}/poller.cc
    ${CURRENT_DIR}/session.cc
)

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/io)