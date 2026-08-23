///@description
 
menu = ["Jog]r", "Tutori]l", "S]ir"]
menu_fases = ["f]se 1","f]se 2","f]se 3"]
//qual menu esta selecionado agora
menu_atual = menu

//posso mexer nos botoes do menu?
controle = true

//sairem da room com efeito
modi = 0
//qual botão esta selecionado
atual = 0
//fazer o botão selecionado ir pra frente
margem = 20

controla_menu = function()
{
	//se a setinha p cima é apertada
	if keyboard_check_pressed(vk_up)
	{
		
		//margem setada p 0, logo sera mexida para frente com efeito
		margem = 0
		som(snd_zap,,1,1,0.1)
		if (atual > 0)
		{
			atual--;
		}
		else
		{
			atual = array_length(menu_atual)	
		}
	}
	//setinha p baixo clicada
	if keyboard_check_pressed(vk_down)
	{
		margem = 0
		som(snd_zap,,1,1,0.1)
		if (atual < array_length(menu_atual)-1)
		{
			
			atual++;
		}
		else
		{
			atual = 0
		}	
		
	}
	//manter a opção dentro dos limites
	atual = clamp(atual,0,array_length(menu_atual)-1)
	//fazer o botão selecionado ir pra frente
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
	//altura/distancia das escritas uma p outra
	var _alt = string_height("(")

	for (var i = 0; i < array_length(menu_atual); ++i) 
	{
		
		var _frent = 0
		var _cor = c_white
		
		//opcao selecionada
		if (atual == i) 
		{
			_frent = margem
			_cor = c_red
		}
		//chegar os bloqueados
		if (i = global.fases_desbloqueadas)
	
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