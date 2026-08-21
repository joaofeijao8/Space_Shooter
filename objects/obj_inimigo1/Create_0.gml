//@description

sequenciado = in_sequence

vida = 3

atirar = function()
{
	var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo1_tiro)
	_tiro.vspeed = 3
}

alarm[0] = global.fps * random_range(1,2)


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
		image_blend = c_blue
		alarm[1] = 5
	}
}

sumir = function()
{
	if (!global.rand && in_sequence != sequenciado)
	{
		instance_destroy(id,0)
	}
}
