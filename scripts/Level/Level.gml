function generator_color_lookup()
{
	/// @function generator_color_lookup(character)
	/// @param {string} The character to check for
	
	switch(argument[0])
	{		
		
		//	  $-B-G-R
		case ($00FF00):
			return obj_player;
			
		case ($FF00FF):
			return obj_enemy;
			
		case ($241CEE):
			return obj_wall;
			
		case ($00FFFF):
			return obj_coin;
			
		default:
			return undefined;	
	}
}

function generator_load_level()
{
	/// @param {real; sprite} Sprite to load
	/// @return {boolean} Trhuty; whether the level was successfully generated
	
	// Destroy all level-related instances
	layer_destroy_instances("layer_level")
	
	// Sprite dimensions
	var sprite = argument[0]
	var width = sprite_get_width(sprite)
	var height = sprite_get_height(sprite)
	
	// Draw sprite to surface
	var surf = surface_create(width, height)
	surface_set_target(surf)
	draw_clear_alpha(c_black, 0)
	draw_sprite(sprite, 0, 0, 0)
	surface_reset_target()
	
	// Create buffer; surface -> buffer
	var buffer = buffer_create(4 * width * height, buffer_fixed, 1)
	buffer_get_surface(buffer, surf, 0)
	
	// Iterate over every pixel in the sprite
	for(var i = 0; i < width; i++)
	{
		for(var j = 0; j < height; j++)
		{
			// Convert two dimensions into a single offset, used to peek at buffer
			var offset = 4 * (i + (j * width))
			
			// Extra rgb color values from the pixel			 0 - 255
			var red		= buffer_peek(buffer, offset,			buffer_u8)
			var green	= buffer_peek(buffer, offset + 1,		buffer_u8)
			var blue	= buffer_peek(buffer, offset + 2,		buffer_u8)
			
			// Convert RGB to GM color value
			var color = make_color_rgb(red, green, blue)
			
			// Lookup the object associated with the color
			var object = generator_color_lookup(color)
			
			// Ensure the object is defined
			if(object == undefined) continue
			
			// Create the instance at given coordinates
			instance_create_layer(i * cell_width, j * cell_height, "layer_level", object)
		}
	}
	
	// Cleanup
	surface_free(surf)
	buffer_delete(buffer)
	
	return true
}
