layer_create(0, "layer_level")

level = [spr_level0, spr_level1, spr_level2, spr_level3, spr_level4]
current_level = 0
cell_width = 64
cell_height = 64

generator_load_level(level[0])

global.player_life = 3