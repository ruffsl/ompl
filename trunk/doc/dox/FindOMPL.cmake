# - Find OMPL

include(FindPackageHandleStandardArgs)

if (NOT OMPL_PATH)
  set(OMPL_PATH $ENV{OMPL_PATH})
endif()

if (NOT OMPL_LIB_PATH)
  set(OMPL_LIB_PATH $ENV{OMPL_LIB_PATH})
endif()

if (NOT OMPL_INCLUDE_PATH)
  set(OMPL_INCLUDE_PATH $ENV{OMPL_INCLUDE_PATH})
endif()

if (NOT OMPL_LIB_PATH)
  set(OMPL_LIB_PATH ${OMPL_PATH})
endif()

if (NOT OMPL_INCLUDE_PATH)
  set(OMPL_INCLUDE_PATH ${OMPL_PATH})
endif()


# find the lib
find_library(OMPL_LIBRARY ompl PATHS ${OMPL_LIB_PATH} PATH_SUFFIXES lib)

# find include path
find_path(OMPL_INCLUDE SpaceInformation.h PATHS ${OMPL_INCLUDE_PATH} PATH_SUFFIXES base ompl/base include/ompl/base)
if (OMPL_INCLUDE)
    string(REGEX REPLACE "/ompl/base$" "" OMPL_INCLUDE ${OMPL_INCLUDE})
else()
    set(OMPL_INCLUDE "")
endif()

find_package_handle_standard_args(OMPL DEFAULT_MSG OMPL_LIBRARY OMPL_INCLUDE)
mark_as_advanced(OMPL_LIBRARY OMPL_INCLUDE)
