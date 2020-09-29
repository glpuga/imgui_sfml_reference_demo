cmake_minimum_required(VERSION 3.10.2)

project(
  ImGuiDemoProgram
  VERSION "${project_version}"
  DESCRIPTION "ImGui Demo Setup"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

include(cmake/ccache.cmake)
include(cmake/doxygen.cmake)
enable_doxygen()

include(cmake/compiler_options.cmake)

# ---------------

include("external/imgui-sfml.cmake")

# ---------------

add_executable(${PROJECT_NAME} src/main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC ./include)

target_link_libraries(${PROJECT_NAME} PRIVATE ${PROJECT_NAME}_imgui_sfml)

# set_target_compiler_options(${PROJECT_NAME})

# set_target_properties(
#   ${PROJECT_NAME}
#   PROPERTIES
#     CXX_CLANG_TIDY
#     "clang-tidy;-header-filter=.;-checks=*,-fuchsia-*,-google-*,-zircon-*,-abseil-*,-modernize-use-trailing-return-type,-llvm-*"
#     CXX_CPPCHECK
#     "cppcheck;--language=c++;--std=c++14;--enable=warning,style,performance,portability"
#     CXX_CPPLINT "cpplint;--linelength=120;--filter=+,-build/c++11")

# add_subdirectory("test")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
