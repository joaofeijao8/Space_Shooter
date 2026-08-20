global.debug = false
global.rand = false
global.fps = game_get_speed(gamespeed_fps)

#region funçoes

function explosao_inimigo (_escala,_cor = c_white,_x = x,_y = y)
{
		instance_create_layer(_x,_y,layer,obj_part_explosao_inimigo,{
			image_xscale: _escala,
			image_yscale: _escala,
			image_blend: _cor})
}



#endregion