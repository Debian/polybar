#
# Output build summary
#

function(colored_option message_level text var color_on color_off)
  string(ASCII 27 esc)
  if(${var})
    message(${message_level} "${esc}[${color_on}m${text}${esc}[0m")
  else()
    message(${message_level} "${esc}[${color_off}m${text}${esc}[0m")
  endif()
endfunction()

message(STATUS "--------------------------")
message_colored(STATUS " Build type: ${CMAKE_BUILD_TYPE}" "32;1")
message(STATUS " Compiler C: ${CMAKE_C_COMPILER}")
message(STATUS " Compiler C++: ${CMAKE_CXX_COMPILER}")
message(STATUS " Compiler flags: ${CMAKE_CXX_FLAGS}")

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
  message(STATUS "   debug flags: ${CMAKE_CXX_FLAGS_DEBUG}")
  if(NOT DEFINED ${DEBUG_LOGGER})
    set(DEBUG_LOGGER ON)
  endif()
  if(NOT DEFINED ${ENABLE_CCACHE})
    set(ENABLE_CCACHE ON)
  endif()
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
  message(STATUS "   release: ${CMAKE_CXX_FLAGS_RELEASE}")
elseif(CMAKE_BUILD_TYPE STREQUAL "MinSizeRel")
  message(STATUS "   minsizerel: ${CMAKE_CXX_FLAGS_MINSIZEREL}")
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
  message(STATUS "   relwithdebinfo: ${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
endif()

message(STATUS " Linker flags: ${CMAKE_EXE_LINKER_FLAGS}")

if(CXXLIB_CLANG)
  message(STATUS " C++ library: libc++")
elseif(CXXLIB_GCC)
  message(STATUS " C++ library: libstdc++")
else()
  message(STATUS " C++ library: system default")
endif()

message(STATUS "--------------------------")
colored_option(STATUS " Build testsuite      ${BUILD_TESTS}" BUILD_TESTS "32;1" "37;2")
colored_option(STATUS " Debug logging        ${DEBUG_LOGGER}" DEBUG_LOGGER "32;1" "37;2")
colored_option(STATUS " Verbose tracing      ${VERBOSE_TRACELOG}" VERBOSE_TRACELOG "32;1" "37;2")
colored_option(STATUS " Draw debug hints     ${DEBUG_HINTS}" DEBUG_HINTS "32;1" "37;2")
colored_option(STATUS " Enable ccache        ${ENABLE_CCACHE}" ENABLE_CCACHE "32;1" "37;2")
message(STATUS "--------------------------")
colored_option(STATUS " Enable alsa          ${ENABLE_ALSA}" ENABLE_ALSA "32;1" "37;2")
colored_option(STATUS " Enable i3            ${ENABLE_I3}" ENABLE_I3 "32;1" "37;2")
colored_option(STATUS " Enable mpd           ${ENABLE_MPD}" ENABLE_MPD "32;1" "37;2")
colored_option(STATUS " Enable network       ${ENABLE_NETWORK}" ENABLE_NETWORK "32;1" "37;2")
message(STATUS "--------------------------")
colored_option(STATUS " Enable X RandR       ${ENABLE_RANDR_EXT}" ENABLE_RANDR_EXT "32;1" "37;2")
colored_option(STATUS " Enable X Render      ${ENABLE_RENDER_EXT}" ENABLE_RENDER_EXT "32;1" "37;2")
colored_option(STATUS " Enable X Damage      ${ENABLE_DAMAGE_EXT}" ENABLE_DAMAGE_EXT "32;1" "37;2")
colored_option(STATUS " Enable X Sync        ${ENABLE_SYNC_EXT}" ENABLE_SYNC_EXT "32;1" "37;2")
colored_option(STATUS " Enable X Composite   ${ENABLE_COMPOSITE_EXT}" ENABLE_COMPOSITE_EXT "32;1" "37;2")
message(STATUS "--------------------------")
