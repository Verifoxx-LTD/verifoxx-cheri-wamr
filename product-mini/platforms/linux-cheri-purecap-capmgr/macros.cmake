MACRO(ALL_FILES_AND_INC_FOLDERS curr_dir return_files return_inc_folders)
	# Find all files
	file (GLOB_RECURSE source_all ${curr_dir}/*.c ${curr_dir}/*.cpp ${curr_dir}/*.S)
	file (GLOB_RECURSE inc_all ${curr_dir}/*.h)

	set (${return_files} ${source_all} ${inc_all})

	# Find folders, those containing include files
	set(dir_list "")
	foreach(file_path ${inc_all})
		get_filename_component(dir_path ${file_path} PATH)
		set(dir_list ${dir_list} ${dir_path})
	endforeach()
	list(REMOVE_DUPLICATES dir_list)
	set(${return_inc_folders} ${dir_list})
ENDMACRO()
