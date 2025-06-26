find_package(Python3 REQUIRED)

if(WIN32)
    add_custom_command(
        OUTPUT ${CMAKE_BINARY_DIR}/bundled_dlls
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/mingw-bundledlls.py --copy --output-dir ${CMAKE_BINARY_DIR}/bundled_dlls ${CMAKE_BINARY_DIR}/cctools/bin/ld.exe
        DEPENDS ${CMAKE_BINARY_DIR}/cctools/bin/
        COMMENT "Gettiing bundled DLLs"
    )
    add_custom_target(
        bundled_dlls
        ALL
        DEPENDS ${CMAKE_BINARY_DIR}/bundled_dlls
    )
    install(
        DIRECTORY ${CMAKE_BINARY_DIR}/bundled_dlls
        DESTINATION ${SDK_PATH}/usr/bin
        COMPONENT dlls
        USE_SOURCE_PERMISSIONS
    )
endif()
