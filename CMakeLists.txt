cmake_minimum_required(VERSION 3.7)
project(cmake1)
set(CMAKE_CXX_STANDARD 14)
#添加公用头文件路径
include_directories(include)
#添加qt
include(qt5.cmake)
#创建两个库,这里由于这两个库没有额外的依赖所以直接为空,cmake语法要求必须带参数
AddLibrary(Core "")
AddLibrary(UI "")
#添加可执行程序并添加自己的库依赖
file(GLOB_RECURSE TestApp_SRC TestApp/*)
#最后的mainwindows.h由于是qt头文件需要直接加入以便autouic automoc自动处理QT宏.
add_executable(TestApp ${TestApp_SRC} include/mainwindow.h)
target_link_libraries(TestApp Core UI)