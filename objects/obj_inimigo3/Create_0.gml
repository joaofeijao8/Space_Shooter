//@description

sequenciado = in_sequence

estado = "chegando"
vida = 10

maquina_de_estados = function()
{
	
}


#region functions pai
	morte = function()
{
	instance_destroy()	
	explosao_inimigo(0.8,c_grey, ,y)
	
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
	//caso eu tenha sido sequenciado apenas
	sumir = function()
{
	if (!global.rand && in_sequence != sequenciado)
	{
		instance_destroy()
	}
}
#endregion