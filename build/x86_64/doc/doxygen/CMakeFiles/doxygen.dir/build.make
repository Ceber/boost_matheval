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

# Utility rule file for doxygen.

# Include any custom commands dependencies for this target.
include doc/doxygen/CMakeFiles/doxygen.dir/compiler_depend.make

# Include the progress variables for this target.
include doc/doxygen/CMakeFiles/doxygen.dir/progress.make

doc/doxygen/CMakeFiles/doxygen:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building HTML documentation with Doxygen"
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/doc/doxygen && SOURCE_DIR=/home/ceber/Dev/Cpp/deps/boost_matheval/doc/doxygen/../../ /usr/bin/doxygen /home/ceber/Dev/Cpp/deps/boost_matheval/doc/doxygen/Doxyfile

doxygen: doc/doxygen/CMakeFiles/doxygen
doxygen: doc/doxygen/CMakeFiles/doxygen.dir/build.make
.PHONY : doxygen

# Rule to build all files generated by this target.
doc/doxygen/CMakeFiles/doxygen.dir/build: doxygen
.PHONY : doc/doxygen/CMakeFiles/doxygen.dir/build

doc/doxygen/CMakeFiles/doxygen.dir/clean:
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/doc/doxygen && $(CMAKE_COMMAND) -P CMakeFiles/doxygen.dir/cmake_clean.cmake
.PHONY : doc/doxygen/CMakeFiles/doxygen.dir/clean

doc/doxygen/CMakeFiles/doxygen.dir/depend:
	cd /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ceber/Dev/Cpp/deps/boost_matheval /home/ceber/Dev/Cpp/deps/boost_matheval/doc/doxygen /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64 /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/doc/doxygen /home/ceber/Dev/Cpp/deps/boost_matheval/build/x86_64/doc/doxygen/CMakeFiles/doxygen.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : doc/doxygen/CMakeFiles/doxygen.dir/depend

