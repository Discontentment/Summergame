cmake_minimum_required(VERSION 3.10) # Minimum CMake version
project(Summergame C) # Or CXX if using C++

# Find Raylib and fmt using vcpkg's package configuration
find_package(raylib CONFIG REQUIRED)
find_package(fmt CONFIG REQUIRED) # Make sure this matches your fmt usage (e.g., C++ module)

# Add your executable target
add_executable(${PROJECT_NAME} src/main.c)

# Link against the 'raylib' and 'fmt' targets provided by vcpkg
target_link_libraries(${PROJECT_NAME} PRIVATE raylib fmt::fmt) # fmt::fmt is common for fmt library

# Add platform-specific system libraries Raylib needs (vcpkg often handles some of these)
if(WIN32)
    target_link_libraries(${PROJECT_NAME} PRIVATE winmm gdi32 opengl32)
elseif(UNIX) # Covers both Linux and macOS
    target_link_libraries(${PROJECT_NAME} PRIVATE m) # For math functions
endif()

# (Optional) Set output directory for executables for a cleaner build folder
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")