# setup marble

if(NOT NO_MARBLE)
	if(LIBMARBLE_FROM_PKGCONFIG)
		pkg_config_library(MARBLE libmarble REQUIRED)
		set(MARBLE_LIBRARIES "")
	else()
		find_package(Marble QUIET)
		if(MARBLE_FOUND)
			include_directories(${MARBLE_INCLUDE_DIR})
		else()
			set(NO_MARBLE ON)
			message(STATUS "building without marble widget support")
			add_definitions(-DNO_MARBLE)
			set(MARBLE_LIBRARIES "")
		endif()
	endif()
	add_custom_target(link_marble_data ALL COMMAND rm -rf ./marbledata && ln -sf ${CMAKE_SOURCE_DIR}/marbledata ${CMAKE_BINARY_DIR}/marbledata)
else()
	message(STATUS "building without marble widget support")
	add_definitions(-DNO_MARBLE)
	set(MARBLE_LIBRARIES "")
endif()
