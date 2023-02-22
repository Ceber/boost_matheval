# Add current directory to search path
enable_testing()
add_custom_target(check COMMAND ${CMAKE_CTEST_COMMAND} --output-on-failure -C ${CMAKE_BUILD_TYPE})

# Find Boost
find_package(Boost COMPONENTS unit_test_framework)

function(UNIT_TEST)
  # Parse arguments
  cmake_parse_arguments(UT "" "TARGET" "SOURCE" ${ARGN} )
  # Add target for QI
  # add_executable(matheval.qi.${UT_TARGET} ${UT_SOURCE})
  # target_include_directories(matheval.qi.${UT_TARGET} PRIVATE ${Boost_INCLUDE_DIRS})
  # target_link_libraries(matheval.qi.${UT_TARGET} PRIVATE matheval::qi)
  # set_target_properties(matheval.qi.${UT_TARGET} PROPERTIES
  #     CXX_CLANG_TIDY ""
  #     CXX_STANDARD 98)
  if(MSVC)
    set_property(SOURCE ${UT_SOURCE} PROPERTY COMPILE_FLAGS "/DNOMINMAX")
  endif()
  # Add target for X3
  set(TEST_EXE matheval.x3.${UT_TARGET}_unit-tests)
  add_executable(${TEST_EXE} ${UT_SOURCE})
  target_include_directories(${TEST_EXE} PRIVATE ${Boost_INCLUDE_DIRS})
  target_link_libraries(${TEST_EXE} PRIVATE matheval::x3)
  set_target_properties(${TEST_EXE} PROPERTIES
      CXX_CLANG_TIDY ""
      CXX_STANDARD 14
      RUNTIME_OUTPUT_DIRECTORY ${UNIT_TEST_OUTPUT_DIR}
  )
  if(MSVC)
    set_property(SOURCE ${UT_SOURCE} PROPERTY COMPILE_FLAGS "/DNOMINMAX")
  endif()
  # Tests are executed in the root directory
  # add_test(NAME matheval.qi.${UT_TARGET} COMMAND matheval.qi.${UT_TARGET})
  add_test(NAME ${TEST_EXE} COMMAND ${TEST_EXE})
  # add_dependencies(check matheval.qi.${UT_TARGET} ${TEST_EXE})
  add_dependencies(check ${TEST_EXE})
endfunction(UNIT_TEST)

# Add the tests
if(Boost_FOUND)
  unit_test(TARGET literals SOURCE literals.cpp exprtest.hpp)
  unit_test(TARGET arithmetic SOURCE arithmetic.cpp exprtest.hpp)
  unit_test(TARGET order_of_operations SOURCE order_of_operations.cpp exprtest.hpp)
  unit_test(TARGET unary SOURCE unary.cpp exprtest.hpp)
  unit_test(TARGET functions SOURCE functions.cpp exprtest.hpp)
  unit_test(TARGET variables SOURCE variables.cpp exprtest.hpp)
  #unit_test(TARGET optimizer SOURCE optimizer.cpp)
  unit_test(TARGET errors SOURCE errors.cpp)
  #unit_test(TARGET empty_node SOURCE empty_node.cpp)
  unit_test(TARGET interface SOURCE interface.cpp)
endif()
