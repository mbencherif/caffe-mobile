# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.9.0/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.9.0/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rizkyario/Desktop/caffe-mobile

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a

# Include any dependencies generated for this target.
include src/caffe/CMakeFiles/proto.dir/depend.make

# Include the progress variables for this target.
include src/caffe/CMakeFiles/proto.dir/progress.make

# Include the compile flags for this target's objects.
include src/caffe/CMakeFiles/proto.dir/flags.make

include/caffe/proto/caffe.pb.cc: ../src/caffe/proto/caffe.proto
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running C++/Python protocol buffer compiler on /Users/rizkyario/Desktop/caffe-mobile/src/caffe/proto/caffe.proto"
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && /usr/local/Cellar/cmake/3.9.0/bin/cmake -E make_directory /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && ../../../third_party/arm64-v8a-21-protobuf/bin/protoc --cpp_out /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto -I /Users/rizkyario/Desktop/caffe-mobile/src/caffe/proto /Users/rizkyario/Desktop/caffe-mobile/src/caffe/proto/caffe.proto
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && ../../../third_party/arm64-v8a-21-protobuf/bin/protoc --python_out /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto -I /Users/rizkyario/Desktop/caffe-mobile/src/caffe/proto /Users/rizkyario/Desktop/caffe-mobile/src/caffe/proto/caffe.proto

include/caffe/proto/caffe.pb.h: include/caffe/proto/caffe.pb.cc
	@$(CMAKE_COMMAND) -E touch_nocreate include/caffe/proto/caffe.pb.h

include/caffe/proto/caffe_pb2.py: include/caffe/proto/caffe.pb.cc
	@$(CMAKE_COMMAND) -E touch_nocreate include/caffe/proto/caffe_pb2.py

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o: src/caffe/CMakeFiles/proto.dir/flags.make
src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o: include/caffe/proto/caffe.pb.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o"
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && /Users/rizkyario/Library/Developer/Xamarin/android-ndk/android-ndk-r14b/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o -c /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto/caffe.pb.cc

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.i"
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && /Users/rizkyario/Library/Developer/Xamarin/android-ndk/android-ndk-r14b/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto/caffe.pb.cc > CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.i

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.s"
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && /Users/rizkyario/Library/Developer/Xamarin/android-ndk/android-ndk-r14b/toolchains/aarch64-linux-android-4.9/prebuilt/darwin-x86_64/bin/aarch64-linux-android-g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/include/caffe/proto/caffe.pb.cc -o CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.s

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.requires:

.PHONY : src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.requires

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.provides: src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.requires
	$(MAKE) -f src/caffe/CMakeFiles/proto.dir/build.make src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.provides.build
.PHONY : src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.provides

src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.provides.build: src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o


# Object files for target proto
proto_OBJECTS = \
"CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o"

# External object files for target proto
proto_EXTERNAL_OBJECTS =

lib/libproto.a: src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o
lib/libproto.a: src/caffe/CMakeFiles/proto.dir/build.make
lib/libproto.a: src/caffe/CMakeFiles/proto.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX static library ../../lib/libproto.a"
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && $(CMAKE_COMMAND) -P CMakeFiles/proto.dir/cmake_clean_target.cmake
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/proto.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/caffe/CMakeFiles/proto.dir/build: lib/libproto.a

.PHONY : src/caffe/CMakeFiles/proto.dir/build

src/caffe/CMakeFiles/proto.dir/requires: src/caffe/CMakeFiles/proto.dir/__/__/include/caffe/proto/caffe.pb.cc.o.requires

.PHONY : src/caffe/CMakeFiles/proto.dir/requires

src/caffe/CMakeFiles/proto.dir/clean:
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe && $(CMAKE_COMMAND) -P CMakeFiles/proto.dir/cmake_clean.cmake
.PHONY : src/caffe/CMakeFiles/proto.dir/clean

src/caffe/CMakeFiles/proto.dir/depend: include/caffe/proto/caffe.pb.cc
src/caffe/CMakeFiles/proto.dir/depend: include/caffe/proto/caffe.pb.h
src/caffe/CMakeFiles/proto.dir/depend: include/caffe/proto/caffe_pb2.py
	cd /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rizkyario/Desktop/caffe-mobile /Users/rizkyario/Desktop/caffe-mobile/src/caffe /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe /Users/rizkyario/Desktop/caffe-mobile/build_arm64-v8a/src/caffe/CMakeFiles/proto.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/caffe/CMakeFiles/proto.dir/depend

