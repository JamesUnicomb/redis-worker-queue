cmake_minimum_required(VERSION 3.1...3.29)
project(
  RedisPubSub
  VERSION 1.0
  LANGUAGES CXX)

set (STD_CXX "c++17")
set (REDISCPP_FLAGS "-DREDISCPP_HEADER_ONLY=ON")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -W -Wall -std=${STD_CXX} ${REDISCPP_FLAGS}")
set (CMAKE_CXX_FLAGS_RELEASE "-O3 -g0 -std=${STD_CXX} -Wall -DNDEBUG ${REDISCPP_FLAGS}")
set (CMAKE_POSITION_INDEPENDENT_CODE ON)

find_package(Boost 1.67.0 REQUIRED COMPONENTS thread system iostreams)
find_package(redis-cpp 1.1.0 REQUIRED)

include_directories(${Boost_INCLUDE_DIRS} ${redis-cpp_INCLUDE_DIRS})

add_executable(redispubsub main.cpp)

target_link_libraries(redispubsub ${Boost_LIBRARIES})