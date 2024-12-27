include(FetchContent)

FetchContent_Declare(OpenMesh
        GIT_REPOSITORY ${openmesh_URL}
        GIT_TAG ${openmesh_TAG}
        )

FetchContent_GetProperties(OpenMesh)
if (NOT openmesh_POPULATED)
    message(STATUS "******* FETCHING openmesh dependency from ${PROJECT_NAME} (requested version: ${openmesh_TAG}) *******")
    FetchContent_Populate(OpenMesh)

    # OpenMesh BUILD OPTIONS
    set(BUILD_APPS OFF CACHE BOOL "")
    set(OM_STATIC_BUILD ON CACHE BOOL "")
#    set(OPENMESH_BUILD_SHARED OFF CACHE BOOL "")

    add_subdirectory(${openmesh_SOURCE_DIR} ${openmesh_BINARY_DIR})
endif ()

if (TARGET OpenMeshCore)
    get_target_property(INC OpenMeshCore INTERFACE_INCLUDE_DIRECTORIES)
    target_include_directories(OpenMeshCore INTERFACE ${OPENMESH_INCLUDE_DIR})
endif ()

if (TARGET OpenMeshCoreStatic)
    get_target_property(INC OpenMeshCoreStatic INTERFACE_INCLUDE_DIRECTORIES)
    target_include_directories(OpenMeshCoreStatic INTERFACE ${OPENMESH_INCLUDE_DIR})
endif ()
