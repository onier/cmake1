#请填写你qt的安装目录
set(QT_ROOT /opt/Qt5.7.1/5.7/gcc_64)
set(Qt5Core_DIR ${QT_ROOT}/lib/cmake/Qt5Core)
set(Qt5_DIR ${QT_ROOT}/lib/cmake/Qt5)
set(QT_QMAKE_EXECUTABLE ${QT_ROOT}/bin/qmake)
set(CMAKE_PREFIX_PATH ${QT_ROOT}/lib/cmake)
#查找qt相关依赖
find_package(Qt5 REQUIRED COMPONENTS Widgets Gui Qml OpenGL)
ADD_DEFINITIONS("-DQT_DISABLE_DEPRECATED_BEFORE=0")
ADD_DEFINITIONS("-DQT_NO_DEBUG")
ADD_DEFINITIONS("-DQT_WIDGETS_LIB")
ADD_DEFINITIONS("-DQT_GUI_LIB")
ADD_DEFINITIONS("-DQT_CORE_LIB")

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)


set(QT5ALL_INCLUDE_DIRS ${Qt5Widgets_INCLUDE_DIRS} ${Qt5Gui_INCLUDE_DIRS} ${Qt5Qml_INCLUDE_DIRS} ${Qt5OpenGL_INCLUDE_DIRS})
set(QT5ALL_INCLUDE_LIBRARIES ${Qt5Widgets_LIBRARIES} ${Qt5Gui_LIBRARIES} ${Qt5Qml_LIBRARIES} ${Qt5OpenGL_LIBRARIES})
add_library(QT5ALL IMPORTED INTERFACE)
set_property(TARGET QT5ALL PROPERTY
        INTERFACE_INCLUDE_DIRECTORIES ${QT5ALL_INCLUDE_DIRS})
set_property(TARGET QT5ALL PROPERTY
        INTERFACE_LINK_LIBRARIES ${QT5ALL_INCLUDE_LIBRARIES})


function(AddLibrary DIR LIBS)
    file(GLOB_RECURSE QRCS ${DIR}/*.qrc)
    file(GLOB_RECURSE SRCS ${DIR}/*)
    qt5_add_resources(QRCS ${QRC})
    ADD_LIBRARY(${DIR} SHARED ${SRCS} ${QRCS})
    target_link_libraries(${DIR} QT5ALL ${LIBS})
    set_target_properties(${DIR} PROPERTIES VERSION 1 SOVERSION 2)
    install(TARGETS ${DIR} LIBRARY DESTINATION lib ARCHIVE DESTINATION lib COMPONENT libraries)
endfunction()