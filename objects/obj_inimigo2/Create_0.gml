//@description
piscando = false
yscale = 1
xscale = 1
sequenciado = in_sequence
segundos_carregar = 0;
estado = "chegando"
vida = 35
ataques = 0
velv = 0
velh = 0
limite_atks = 10

atirar = function()
{
	if(instance_exists(obj_player))
	{
		
		var _p = obj_player
		var _direcao = point_direction(x,y,_p.x,_p.y)
		
		var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo2_tiro)
		_tiro.vel = 2
        var _vel = _tiro.vel
        _tiro.velh = lengthdir_x(_vel,_direcao)
        _tiro.velv = lengthdir_y(_vel,_direcao)
        _tiro.image_angle = _direcao + 90;
		
	}
}	

atirar2 = function()
{
	if(instance_exists(obj_player))
	{
		
		var _angDif = 20
        var _ang = -_angDif
		repeat(3)
		{
			var _tiro = instance_create_layer(x,y,"tiro_inimigo",obj_inimigo2_tiro2)
			
			_tiro.direction = 270 + _ang
            _ang += _angDif
            
            var _vel = _tiro.vel
            var _dir = _tiro.direction
            
            
            _tiro.velh = lengthdir_x(_vel,_dir)
            _tiro.velv = lengthdir_y(_vel,_dir)
            _tiro.image_angle = _tiro.direction + 90;
			
			
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
					velv = 2;
				}
				else
				{
					velv = 0;
					estado = "carregando"
				}
			break;
			
		case "carregando":
			segundos_carregar++;
			var _tempo_carregar = global.segundos * 1
			if (segundos_carregar >= _tempo_carregar)
			{
				if (ataques >= limite_atks)
				{
					estado = "fugindo"
                    var _dir = random(180);
                    velh = lengthdir_x(1,_dir)
                    velv = lengthdir_y(1,_dir)
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
			
			if (y < -100 || x < -100 || x > room_width+100) instance_destroy(id,0)
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