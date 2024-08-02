set(VCPKG_TARGET_ARCHITECTURE arm64)
set(VCPKG_CRT_LINKAGE dynamic)
set(VCPKG_BUILD_TYPE release)

if (PORT MATCHES "openssl")
    set (VCPKG_LIBRARY_LINKAGE dynamic)
else ()
    set (VCPKG_LIBRARY_LINKAGE static)
endif ()
