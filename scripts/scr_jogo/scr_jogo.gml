global.debug = false
global.rand = false
global.segundos = game_get_speed(gamespeed_fps)
global.destino = rm_inicio
global.transicao = false
global.fases_desbloqueadas = 0
global.dificuldade = 0
global.boss = 0 //se esta na luta do boss

#region funçoes


function explosao_inimigo (_escala,_cor = c_white,_x = x,_y = y)
{
		instance_create_layer(_x,_y,layer,obj_part_explosao_inimigo,{
			image_xscale: _escala,
			image_yscale: _escala,
			image_blend: _cor})
}

function tremer (_quanto = 1)
{
	if(instance_exists(obj_screenshake))
	{
		with(obj_screenshake)
		{
			if (treme < _quanto)
			{
				treme = _quanto
			}
		}
	}
}

function boing_in(_xx = 2,_yy = 0.7)
{
	xscale = _xx
	yscale = _yy
}

function boing_out()
{
	if(yscale < 0.95)
	{
		yscale = lerp(yscale, 1, 0.1)	
	}
	else
	{
		yscale = 1
	}
	if(xscale > 1.1)
	{
		xscale = lerp(xscale, 1, 0.1)	
	}
	else
	{
		xscale = 1
	}
}	

function me_desenhe()
{
	if(!variable_instance_exists(id,"yscale")) yscale = image_yscale
	if(!variable_instance_exists(id,"xscale")) xscale = image_xscale
	draw_sprite_ext(sprite_index,image_index,x,y,xscale,yscale,image_angle,image_blend,image_alpha)	
}

function piscar()
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

function musica()
{
	if (!instance_exists(obj_musicas)) instance_create_layer(0,0,"jogo",obj_musicas)	
}

function som (_som,_loop = 0,_pitch = 0,_pararSomIgual = 0,_qntPitch = 0.2,_volume = 0.5)
{
	if (_pararSomIgual) audio_stop_sound(_som)
	if (!_pitch)
	{
		var _pit = 1
	}
	else
	{
		_pit = random_range(1-_qntPitch,1+_qntPitch)	
	}
	audio_play_sound(_som,0,_loop,_volume , ,_pit)	
}

function troca_mapa(_destino,_xtrans = 0 ,_ytrans = 0)
{
	global.destino = _destino
	layer_sequence_create("transicao",_xtrans,_ytrans,sq_trasicao1)
}

function muda_mapa()
{
	
	room_goto(global.destino)
}

function transOn()
{
	global.transicao = true	
}

function transOff()
{
	global.transicao = false	
}


#endregion