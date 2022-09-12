# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.23.3-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.23.3-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ceber/Dev/Cpp/deps/boost_matheval

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64

# Include any dependencies generated for this target.
include tests/CMakeFiles/matheval.qi.literals.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/matheval.qi.literals.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/matheval.qi.literals.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/matheval.qi.literals.dir/flags.make

tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o: tests/CMakeFiles/matheval.qi.literals.dir/flags.make
tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o: ../../tests/literals.cpp
tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o: tests/CMakeFiles/matheval.qi.literals.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o"
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o -MF CMakeFiles/matheval.qi.literals.dir/literals.cpp.o.d -o CMakeFiles/matheval.qi.literals.dir/literals.cpp.o -c /home/ceber/Dev/Cpp/deps/boost_matheval/tests/literals.cpp

tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/matheval.qi.literals.dir/literals.cpp.i"
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/ceber/Dev/Cpp/deps/boost_matheval/tests/literals.cpp > CMakeFiles/matheval.qi.literals.dir/literals.cpp.i

tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/matheval.qi.literals.dir/literals.cpp.s"
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/ceber/Dev/Cpp/deps/boost_matheval/tests/literals.cpp -o CMakeFiles/matheval.qi.literals.dir/literals.cpp.s

# Object files for target matheval.qi.literals
matheval_qi_literals_OBJECTS = \
"CMakeFiles/matheval.qi.literals.dir/literals.cpp.o"

# External object files for target matheval.qi.literals
matheval_qi_literals_EXTERNAL_OBJECTS =

tests/matheval.qi.literals: tests/CMakeFiles/matheval.qi.literals.dir/literals.cpp.o
tests/matheval.qi.literals: tests/CMakeFiles/matheval.qi.literals.dir/build.make
tests/matheval.qi.literals: src/qi/libmatheval.qi.a
tests/matheval.qi.literals: tests/CMakeFiles/matheval.qi.literals.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable matheval.qi.literals"
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matheval.qi.literals.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/matheval.qi.literals.dir/build: tests/matheval.qi.literals
.PHONY : tests/CMakeFiles/matheval.qi.literals.dir/build

tests/CMakeFiles/matheval.qi.literals.dir/clean:
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests && $(CMAKE_COMMAND) -P CMakeFiles/matheval.qi.literals.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/matheval.qi.literals.dir/clean

tests/CMakeFiles/matheval.qi.literals.dir/depend:
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ceber/Dev/Cpp/deps/boost_matheval /home/ceber/Dev/Cpp/deps/boost_matheval/tests /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64 /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/tests/CMakeFiles/matheval.qi.literals.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/matheval.qi.literals.dir/depend

