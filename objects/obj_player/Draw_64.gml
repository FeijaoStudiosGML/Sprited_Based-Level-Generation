draw_set_alpha(.65)
draw_rectangle(15, 10, 245, 94, 0)
for(var i = 0; i < global.player_life; i++)
{
	draw_sprite(spr_hud_life, 0, 20 + (i * 74), 20)
}
draw_set_alpha(1)