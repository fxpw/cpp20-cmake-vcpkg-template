cmake_minimum_required(VERSION 2.8...3.28)
project(cpp20_web_backend_template VERSION 0.1.0 LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)


add_executable(${PROJECT_NAME} main.cpp)

find_package(CURL REQUIRED)
find_package(OpenSSL REQUIRED)
target_link_libraries(${PROJECT_NAME} PRIVATE CURL::libcurl OpenSSL::SSL OpenSSL::Crypto)


