#header-only library
include(vcpkg_common_functions)

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO j0r1/JRTPLIB
    REF v3.11.2
    SHA512 b828d03d4c9ca162eb139b2cf96be0d898531054cc7dde48f05ea7817799df246306191a5d3d77eb1562f4221710fda9bf77e1f8a94edf425f7ed84c067e68ee
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()

file(INSTALL ${SOURCE_PATH}/LICENSE.MIT DESTINATION ${CURRENT_PACKAGES_DIR}/share/jrtplib RENAME copyright)

# Fix CMake files
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/jrtplib)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")