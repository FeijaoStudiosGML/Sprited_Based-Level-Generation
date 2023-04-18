if(instance_exists(obj_gameOver))
{
	image_speed = 0
	exit
}

image_speed = 1

var _left	= keyboard_check(ord("A"))
var _right	= keyboard_check(ord("D"))
var _up		= keyboard_check(ord("W"))
var _down	= keyboard_check(ord("S"))

velh = (_right - _left) * vel
velv = (_down - _up) * vel

move_and_collide(velh, velv, obj_wall)

if(velh != 0 or velv != 0 or velh != 0 and velv != 0)
{
	sprite_index = spr_player_run
}
else
{
	sprite_index = spr_player_idle
}

if(velh != 0)
{
	image_xscale = sign(velh)
}

if(damage)
{
	image_alpha = .5
}
else
{
	image_alpha = 1
}

if(global.player_life <= 0)
{
	instance_create_layer(0, 0, layer, obj_gameOver)
}