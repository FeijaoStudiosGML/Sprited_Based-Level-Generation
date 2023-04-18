if(instance_exists(obj_gameOver)) exit

if(keyboard_check(vk_escape))
{
	game_end()
}

if(!instance_exists(obj_coin))
{
	if(current_level < array_length_1d(level)-1)
	{
		current_level++
	}
	
	else
	{
		instance_create_layer(0, 0, layer, obj_gameOver)
	}
	
	generator_load_level(level[current_level])
}