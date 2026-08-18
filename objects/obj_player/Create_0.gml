///@description

#region variaveis
var seg = global.fps
vel = 2.5
cd_tiro = 10
segundos = 0


vida = 3;
escudo = 3;
meu_escudo = noone
lv_tiro = 1;
tempo_invencivel = seg
timer_invencivel = 0

#endregion

#region metodos
//sistema de movimentação do player
//metodo de controlar o player
controla_player = function()
{
	timer_invencivel--;
	//teclas
	var _up, _down, _left, _right, _shot;
	_up		 = keyboard_check(ord("W")) || keyboard_check(vk_up);
	_down	 = keyboard_check(ord("S")) || keyboard_check(vk_down);
	_right	 = keyboard_check(ord("D")) || keyboard_check(vk_right);
	_left	 = keyboard_check(ord("A")) || keyboard_check(vk_left);
	
	_shot	 = keyboard_check(vk_space) || mouse_check_button(mb_left)
	
	
	//movimentação
	var _velh = (_right - _left) * vel;
	x += _velh
	var _velv = (_down - _up) * vel;
	y += _velv
	//limitando a movimentação do player
	x = clamp(x, sprite_width/2, room_width-sprite_height/2)
	y = clamp(y, sprite_height/2, room_height-sprite_height/2)
	
	//teclas apertadas
	//espaço pressionado
	segundos++;
	if (_shot && segundos >= cd_tiro){
		switch(lv_tiro)
		{
			case 1: 
				tiro_1(c_white)
				cd_tiro = 10
			break;
			
			case 2: 
				tiro_2(5,c_red)
				cd_tiro = 15
			break;
			
			case 3: 
				tiro_3(c_blue)
				cd_tiro = 20
			break; 
			
			case 4: 
				tiro_4(c_orange)
				cd_tiro = 25
			break;
		}
		
		segundos = 0
	}
}



//metodo do tiro 1
tiro_1 = function(cor) 
{
	
	var _tiro = instance_create_layer(x,y,"tiro",obj_tiro)
		
		_tiro.vspeed =-6
		_tiro.image_blend = cor
}

tiro_2 = function(dif,cor)
{
	
	var _tiro = instance_create_layer(x+dif,y,"tiro",obj_tiro)
	_tiro.vspeed =-6
	_tiro.image_blend = cor
		
	_tiro = instance_create_layer(x-dif,y,"tiro",obj_tiro)
	_tiro.vspeed =-6
	_tiro.image_blend = cor
}

tiro_3 = function(cor)
{
		
	tiro_1(cor)
	tiro_2(7,cor)
}

tiro_4 = function(cor)
{
	var _tiro = instance_create_layer(x,y,"tiro",obj_tiro)
	_tiro.image_xscale = 2
	_tiro.image_yscale = 2
	_tiro.vspeed = -4
	_tiro.image_blend = cor
}

lvl_up = function()
{
	if(lv_tiro < 4)
	{
	lv_tiro++;
	}
	
}

desenha_icone = function(spr,qnts,xx = 25,yy)
{
	
	var _posx = xx
	repeat(qnts){
	
		draw_sprite_ext(spr,0,_posx,yy,2,2,0,c_white,0.7)
		_posx += 50
	}
}

perde_vida = function()
{	if(timer_invencivel > 0 ) return;
	
	if (vida > 1){
		vida--;
		timer_invencivel = tempo_invencivel
	}
	else
	{
		instance_destroy()
	}
}

usa_escudo = function()
{
	if(escudo > 0 && !instance_exists(meu_escudo))
	{
		escudo--;	
		meu_escudo = instance_create_layer(x,y,"escudo",obj_escudo)
	}
}
#endregion
