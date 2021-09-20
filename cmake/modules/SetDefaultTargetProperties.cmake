macro(set_default_target_properties TARGET_NAME)
	set_property(TARGET ${TARGET_NAME} PROPERTY NO_SYSTEM_FROM_IMPORTED ON)
	set_property(TARGET ${TARGET_NAME} PROPERTY CXX_STANDARD 17)
	set_property(TARGET ${TARGET_NAME} PROPERTY CXX_STANDARD_REQUIRED ON)
	if(WITH_LTO)
		if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
			target_compile_options(${TARGET_NAME} PRIVATE ${GCC_LTO_FLAGS})
			target_link_options(${TARGET_NAME} PRIVATE ${GCC_LTO_FLAGS})
		else()
			set_target_properties(${TARGET_NAME} PROPERTIES INTERPROCEDURAL_OPTIMIZATION TRUE)
		endif()
	endif()
endmacro()
