///@description
 
menu = ["Jog]r", "Tutori]l", "S]ir"]

modi = 0
atual = 0
margem = 20

controla_menu = function()
{
	if keyboard_check_pressed(vk_up)
	{
		margem = 0
		som(snd_zap,,1,1,0.1)
		if (atual > 0)
		{
			atual--;
		}
		else
		{
			atual = array_length(menu)	
		}
	}
	if keyboard_check_pressed(vk_down)
	{
		margem = 0
		som(snd_zap,,1,1,0.1)
		if (atual < array_length(menu)-1)
		{
			
			atual++;
		}
		else
		{
			atual = 0
		}	
		
	}
	atual = clamp(atual,0,array_length(menu)-1)
	margem = lerp(margem,20,.2)	
}

desenha_menu = function()
{
	#region botões do menu
	
	//definindo sets
	draw_set_valign(1)
	draw_set_font(fnt_menu)

	//definido vars
	var _meio = display_get_gui_height()/2
	var _alt = string_height("(")

	for (var i = 0; i < array_length(menu); ++i) 
	{
		var _frent = 0
		var _cor = c_white
		if (atual == i) 
		{
			_frent = margem
			_cor = c_red
		}
	
		draw_set_colour(_cor)
	    draw_text(20+_frent+modi,_meio + i*_alt*0.8,menu[i])
		draw_set_color(-1)
	}


	//resetando sets
	draw_set_valign(0)
	draw_set_font(-1)	
	
	#endregion
	
	#region transicoes
	
	if (keyboard_check_pressed(vk_enter))
	{
		var _roomx = room_width
		var _roomy = room_height/2
		switch(atual)
		{
			case 0:
				global.destino = rm_jogo
				layer_sequence_create("transicao",_roomx,_roomy,sq_trasicao1)
				transOn()
			break;
			
			case 1:
				global.destino = rm_tutoriala
				layer_sequence_create("transicao",_roomx,_roomy,sq_trasicao1)
				transOn()
			break;
			
			case 2:
				game_end()
			break;
		}
		tween(id,"modi",-700,tween_animation.back_in,20)
	}
	
	#endregion
}