# Usage:
# cc_proto_lib(demo_proto_lib demo.proto)
# depend:  
#   CURRENT_DIR -> real dir which the proto file location
#   lib protobuf

function(cc_proto_lib)
    set(PROTO_LIB  ${ARGV0})
    set(PROTO_FILE ${ARGV1})

    if(${ARGC} LESS 2)
        return()
    elseif(${ARGC} GREATER 2)
        set(PROTO_DEPS ${ARGV2})
    endif()

    string(REGEX REPLACE ".+/(.+)\\..*" "\\1" PROTO_FILE_NAME ${PROTO_FILE})

    add_custom_command(
        OUTPUT  ${CURRENT_DIR}/${PROTO_FILE_NAME}.pb.cc ${CURRENT_DIR}/${PROTO_FILE_NAME}.pb.h
        COMMAND ${PROTOC_CMD} --cpp_out=${APOLLO_ROOT} --proto_path=${APOLLO_ROOT} ${PROTO_FILE}
        DEPENDS ${PROTO_FILE}
        WORKING_DIRECTORY ${APOLLO_ROOT}
        COMMENT "Generate Cpp Protobuf Source Files: in ${PROTO_FILE}"
    )

    add_library(${PROTO_LIB}  OBJECT ${CURRENT_DIR}/${PROTO_FILE_NAME}.pb.cc)
    target_include_directories(${PROTO_LIB} PUBLIC 
        $<BUILD_INTERFACE:${APOLLO_ROOT}>
        $<BUILD_INTERFACE:${PROTOBUF_INCLUDE_DIRS}>
        $<INSTALL_INTERFACE:include/>)
    set_target_properties(${PROTO_LIB} PROPERTIES 
        LINK_LIBRARIES ${PROTOBUF_LIBRARIES})
    target_compile_options(${PROTO_LIB} PUBLIC "-fPIC")

    # 扫描依赖库
    foreach(dep ${${PROTO_DEPS}})
        string(REGEX MATCH "//(.*):(.*)" pattern ${dep})
        if(NOT ${pattern} STREQUAL "")
            string(REGEX REPLACE "//(.*):(.*)" "\\1" dep_dir ${dep})
            string(REGEX REPLACE "//(.*):(.*)" "\\2" dep_lib ${dep})
            # message("pattern[${pattern}], dep dir[${dep_dir}], dep_lib[${dep_lib}]")
            # pattern = //[dir:lib] 库与当前编译目标不在同级目录
            # add_dependencies(${PROTO_LIB}  ${dep_lib})
        else()
            string(REGEX MATCH ":(.*)" pattern ${dep})
            if(NOT ${pattern} STREQUAL "")
                string(REGEX REPLACE ":(.*)" "\\1" dep_lib ${dep})
                # pattern= [:lib] 库与当前编译目标库处于同级目录
                # message("pattern[${pattern}], dep dir[${dep_dir}], dep_lib[${dep_lib}]")
                add_dependencies(${PROTO_LIB}  ${dep_lib})
            endif()
        endif()
    endforeach()

    unset(PROTO_LIB)
    unset(PROTO_FILE)
endfunction(cc_proto_lib)
