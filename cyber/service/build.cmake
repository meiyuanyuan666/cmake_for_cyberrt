set(CURRENT_DIR ${APOLLO_ROOT}/cyber/service)

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/service)