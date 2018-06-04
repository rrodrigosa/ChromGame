//initialize all bossPath objects
boss_path_quantity = instance_number(bossPath)
boss_path_array[0] = 0

for (var i = 0; i < boss_path_quantity; i++) {
	boss_path_array[i] = instance_find(bossPath, i)
	//show_debug_message("times: "+string(boss_path_array[i]))
}