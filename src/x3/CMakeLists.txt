add_library(boost_matheval SHARED
  ast_adapted.hpp
  ast.hpp
  evaluator.cpp
  evaluator.hpp
  matheval.cpp
  math.hpp
  parser.cpp
  parser_def.hpp
  parser.hpp
  )
target_include_directories(boost_matheval
  PUBLIC 
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include/matheval/x3>
  )
target_compile_features(boost_matheval
  PUBLIC cxx_std_14
  )
find_package(Boost 1.65.1 REQUIRED)
target_link_libraries(boost_matheval
  PRIVATE Boost::boost
  )
add_library(matheval::x3 ALIAS boost_matheval)
