cmake_minimum_required(VERSION 3.10)
project(simple_opencv_example)

find_package(OpenCV REQUIRED)

add_executable(simple simple.cpp)
target_include_directories(simple PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(simple PRIVATE ${OpenCV_LIBS})