set(OpenGL_GL_PREFERENCE "LEGACY")
find_package(OpenGL)
find_package(GLUT)
find_package(SFML COMPONENTS system window graphics audio network)

set(IMGUI_SFML_IMGUI_DEMO ON)

add_library(
  ${PROJECT_NAME}_imgui_sfml
  ${CMAKE_CURRENT_LIST_DIR}/imgui/imgui.cpp
  ${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_demo.cpp
  ${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_widgets.cpp
  ${CMAKE_CURRENT_LIST_DIR}/imgui/imgui_draw.cpp
  ${CMAKE_CURRENT_LIST_DIR}/imgui-sfml/imgui-SFML.cpp)

target_include_directories(
  ${PROJECT_NAME}_imgui_sfml PUBLIC ${CMAKE_CURRENT_LIST_DIR}/imgui
                                    ${CMAKE_CURRENT_LIST_DIR}/imgui-sfml)

target_link_libraries(
  ${PROJECT_NAME}_imgui_sfml
  PUBLIC ${SFML_LIBRARIES} ${OPENGL_LIBRARIES} ${GLUT_LIBRARIES} sfml-graphics
         sfml-window sfml-system)
