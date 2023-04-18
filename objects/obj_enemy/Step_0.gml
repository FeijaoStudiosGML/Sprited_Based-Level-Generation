if(instance_exists(obj_gameOver))
{
	image_speed = 0
	exit
}

image_speed = 1

mp_potential_step(obj_player.x, obj_player.y, vel, 0)