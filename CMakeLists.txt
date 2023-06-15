cmake_minimum_required(VERSION 3.23)

project(nanoCHIP8)

find_package(SDL2)

# Packages pulled by SDL2
# Both coming from xorgproto
find_package(X11)
find_package(OpenGL)
message("X11 include directories: ${X11_INCLUDE_DIRS}")

add_library(imgui-lib STATIC
      imgui/imgui.cpp
      imgui/imgui_demo.cpp
      imgui/imgui_draw.cpp
      imgui/imgui_tables.cpp
      imgui/imgui_widgets.cpp
      imgui/backends/imgui_impl_sdl2.cpp
      imgui/backends/imgui_impl_opengl3.cpp)

target_include_directories(imgui-lib PRIVATE
      imgui
      ${X11_INCLUDE_DIRS}
      ${SDL2_INCLUDE_DIRS})

target_link_libraries(imgui-lib PRIVATE SDL2::SDL2 ${X11_LIBRARIES})

add_library(chip8-runtime STATIC src/runtime/runtime.cpp)

add_executable(nanoCHIP8 src/frontend/main.cpp)
target_include_directories(nanoCHIP8 PRIVATE chip8-runtime imgui ${SDL2_INCLUDE_DIRS} ${X11_INCLUDE_DIRS})
target_link_libraries(nanoCHIP8 PRIVATE
      chip8-runtime
      imgui-lib
      OpenGL::GL
      SDL2::SDL2
      ${X11_LIBRARIES})
