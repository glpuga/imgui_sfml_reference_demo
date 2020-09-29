cmake_minimum_required(VERSION 3.10.2)

project(
  ImGuiExample
  VERSION "${project_version}"
  DESCRIPTION "ImGui toy program"
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")

set(OpenGL_GL_PREFERENCE "LEGACY")
find_package(OpenGL)
find_package(GLUT)

set(EXTERNAL_LIBS ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES} )

include(cmake/ccache.cmake)

include(cmake/doxygen.cmake)
enable_doxygen()

include(cmake/compiler_options.cmake)

# ---------------

include("external/imgui_sfml.cmake")

# ---------------

add_executable(${PROJECT_NAME} src/main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC ./include PRIVATE ${IMGUI_SFML_INCLUDE_DIRS})

target_link_libraries(${PROJECT_NAME} ${IMGUI_SFML_TARGET} ${EXTERNAL_LIBS})

# set_target_compiler_options(${PROJECT_NAME})

# target_compile_options(${PROJECT_NAME} PRIVATE -Werror -Wall -Wextra -Wno-missing-field-initializers)

#set_target_properties(
#  ${PROJECT_NAME}
#  PROPERTIES
#    CXX_CLANG_TIDY
#    "clang-tidy;-header-filter=.;-checks=*,-fuchsia-*,-google-*,-zircon-*,-abseil-*,-modernize-use-trailing-return-type,-llvm-*"
#    CXX_CPPCHECK
#    "cppcheck;--language=c++;--std=c++14;--enable=warning,style,performance,portability"
#    CXX_CPPLINT "cpplint;--linelength=120;--filter=+,-build/c++11")

# add_subdirectory("test")

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
