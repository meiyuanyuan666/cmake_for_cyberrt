set(CURRENT_DIR ${APOLLO_ROOT}/cyber/event)

set(cyber_event_srcs 
    ${CURRENT_DIR}/perf_event_cache.cc)

file(GLOB hdrs "${CURRENT_DIR}/*.h")
install(FILES ${hdrs} DESTINATION cyber/event)