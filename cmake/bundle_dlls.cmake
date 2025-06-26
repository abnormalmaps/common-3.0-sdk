find_package(Python3 REQUIRED)

if(WIN32)
    add_custom_command(
        OUTPUT ${CMAKE_BINARY_DIR}/bundled_dlls
        COMMAND ${Python3_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/mingw-bundledlls.py --copy --output-dir ${CMAKE_BINARY_DIR}/bundled_dlls ${CMAKE_BINARY_DIR}/cctools/bin/ld.exe
        DEPENDS ${CMAKE_BINARY_DIR}/cctools/bin/
    )
    install(
        DIRECTORY ${CMAKE_BINARY_DIR}/bundled_dlls
        DESTINATION ${SDK_PATH}/usr/bin
        USE_SOURCE_PERMISSIONS
    )
endif()
