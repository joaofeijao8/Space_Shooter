//@description
piscando = false
yscale = 1
xscale = 1
sequenciado = in_sequence
segundos_carregar = 0;
estado = "chegando"
vida = 35
ataques = 0

atirar = function()
{
	if(instance_exists(obj_player))
	{
		
		var _p = obj_player
		var _direcao = point_direction(x,y,_p.x,_p.y)
		
		var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo2_tiro)
		
		_tiro.speed = 2 
		_tiro.direction = _direcao
		_tiro.image_angle = _direcao + 90
	}
}	

atirar2 = function()
{
	if(instance_exists(obj_player))
	{
		
		var _ang = -20
		repeat(3)
		{
			var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo2_tiro2)
			_tiro.vspeed = 5
			_tiro.direction = 270 + _ang
			_tiro.image_angle =  _tiro.direction + 90
			_ang += 20
		}
	}
}

maquina_de_estados = function()
{
	
	
	switch(estado)
	{
		case "chegando":
				if (y < 160)
				{
					vspeed = 2
				}
				else
				{
					vspeed = 0
					estado = "carregando"
				}
			break;
			
		case "carregando":
			segundos_carregar++;
			var _tempo_carregar = global.segundos * 1
			if (segundos_carregar >= _tempo_carregar)
			{
				if (ataques >= 4)
				{
					estado = "fugindo"
				}
				else
				{
					estado = choose("atirando","atirando2")
					segundos_carregar = 0
					ataques++;
				}
			}
			break;
			
		case "atirando":
					
			atirar()
			estado = "carregando"
			break;
		
		case "atirando2":
			atirar2()
			estado = "carregando"
			break;
			
		case "fugindo":
			vspeed = -1
			if (y < -100) instance_destroy(id,0)
			break;
	}
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
		boing_in(1.5,0.8)
		vida -= _dano;
		if (vida <= 0)
		{
			morte()	
		}
		else
		{
			piscando = true
			alarm[1] = 5
		}
	}
		//caso eu tenha sido sequenciado apenas
		sumir = function()
	{
		if (!global.rand && in_sequence != sequenciado)
		{
			instance_destroy(id,0)
		}
	}
	
	
#endregion