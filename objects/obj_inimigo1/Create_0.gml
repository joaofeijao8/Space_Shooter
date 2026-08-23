//@description

sequenciado = in_sequence
piscando = false
pisca = noone
vida = 3
xscale = 1
yscale = 1

atirar = function()
{
	var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo1_tiro)
	_tiro.vspeed = 3
}

alarm[0] = global.segundos * random_range(1,2)


morte = function()
{
	instance_destroy()	
	explosao_inimigo(0.5,c_red, ,y)
	
}

colisao = function()
{
	morte()
	obj_player.perde_vida()
}
 
toma_dano = function(_dano)
{
	vida -= _dano;
	if (vida <= 0)
	{
		morte()	
	}
	else
	{
		piscando = true
		boing_in()
		alarm[1] = 5
	}
}

piscar = function()
{
	if (piscando)
	{
	gpu_set_blendmode(bm_add)
	repeat(3)
	{
		draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha)	
	}
	gpu_set_blendmode(bm_normal)
}	
}

sumir = function()
{
	if (!global.rand && in_sequence != sequenciado)
	{
		instance_destroy(id,0)
	}
}
