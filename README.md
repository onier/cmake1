# cmake1
`this is a cmake project , you can learn cmake some basic useage,and even use in your code, enjoye it !
`
you simple just AddLibrary ,this function will create library with depend for you ,include some qt configuration.

**AddLibrary(Core "")**

**AddLibrary(UI "")**


**file(GLOB_RECURSE TestApp_SRC TestApp/*)

add_executable(TestApp ${TestApp_SRC} include/mainwindow.h)

target_link_libraries(TestApp Core UI)**
