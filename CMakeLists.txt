cmake_minimum_required(VERSION 3.8.2 FATAL_ERROR)

# Version
set(boost_matheval_VERSION_MAJOR 0)
set(boost_matheval_VERSION_MINOR 0)
set(boost_matheval_VERSION_PATCH 1)
set(boost_matheval_VERSION ${boost_matheval_VERSION_MAJOR}.${boost_matheval_VERSION_MINOR}.${boost_matheval_VERSION_PATCH})
message(STATUS "####### boost_matheval_VERSION:            "   ${boost_matheval_VERSION})

project(boost_matheval VERSION ${boost_matheval_VERSION} DESCRIPTION "C++ MathEval 2nd party lib - Boost Matheval is a libary built on top of Boost.Spirit, Boost.Fusion, and Boost.Phoenix to parse and evaluate mathematical expressions.")
enable_language(CXX)

# Module and Packages
include(CMakePackageConfigHelpers)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
include(Config)


############################################################################
# Options
############################################################################
option(DEBUG_MODE       "Enable 'debug mode' support."           OFF)
option(BUILD_TESTS      "Build Tests."                           OFF)
option(BUILD_TOOLS      "Build Tools"                            ON)
option(BUILD_DEMOS      "Build Demos."                           ON)
option(BUILD_DOC        "Build documentation"                    ON)
option(CODE_COVERAGE    "Enable code coverage testing support"   ON)
option(CONAN_BUILD      "Building from conan."                   OFF)
option(ASAN             "Enable Address Satinizer."              OFF)


# Default build type is Debug
if(NOT CMAKE_BUILD_TYPE)
   set(CMAKE_BUILD_TYPE Debug CACHE STRING "Choose the build type" FORCE)
endif()

# Add local package finders
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

if(CODE_COVERAGE)
  if("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
    link_libraries(gcov)
  else()
    message(WARNING "Coverage information only supported on GCC")
  endif()
endif()

if(CMAKE_VERSION VERSION_GREATER 3.5.2 AND CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
  option(WITH_CLANG_TIDY "Run Clang-Tidy during compilation" OFF)
endif()
if(WITH_CLANG_TIDY)
  string(REGEX REPLACE "^([1-9]+\\.[0-9]+).*$" "\\1" CLANG_MINOR_VERSION "${CMAKE_CXX_COMPILER_VERSION}")
  find_program(
    CLANG_TIDY_EXE
    NAMES "clang-tidy-${CLANG_MINOR_VERSION}" "clang-tidy"
    DOC "Path to clang-tidy executable"
    )
  if(NOT CLANG_TIDY_EXE)
    message(STATUS "clang-tidy not found.")
  else()
    message(STATUS "clang-tidy found: ${CLANG_TIDY_EXE}")
    set(CMAKE_CXX_CLANG_TIDY "${CLANG_TIDY_EXE}"
      "-checks=-*,bugprone-*,cert-*,clang-analyzer-*,cppcoreguidelines-*,hicpp-*,misc-*,modernize-*,performance-*,readability-*"
      "-header-filter=.*")
      #"-warnings-as-errors=*")
  endif()
endif()


# Subdirectories

add_subdirectory(src/qi EXCLUDE_FROM_ALL)
add_subdirectory(src/x3)
add_subdirectory(doc/doxygen EXCLUDE_FROM_ALL)
add_subdirectory(examples EXCLUDE_FROM_ALL)

if(BUILD_TESTS)
  add_subdirectory(tests)
endif()





############################################################################
# Settings + Directories + Export Install + CPack
############################################################################
# Install public include for developpers
install(DIRECTORY "include/" # source directory
        DESTINATION "${INSTALL_INCLUDE_DIR}" # target directory
        FILES_MATCHING # install only matched files
        PATTERN "*.h*" # select header files
)

include(Lib)


############################################################################
# Options Summary
############################################################################
message(STATUS "############## Commons OPTIONS SUMMARY ##############")
message(STATUS "####### BUILD_TESTS:                        " 	${BUILD_TESTS})
message(STATUS "####### BUILD_DEMOS:                        " 	${BUILD_DEMOS})
message(STATUS "####### BUILD_DOC:                          "   ${BUILD_DOC})
message(STATUS "####### CODE_COVERAGE:                      " 	${CODE_COVERAGE})
message(STATUS "####### CONAN_BUILD:                        " 	${CONAN_BUILD})
message(STATUS "####### ASAN:                               " 	${ASAN})



