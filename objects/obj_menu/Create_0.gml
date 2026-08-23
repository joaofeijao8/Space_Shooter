///@description

menu = ["Jog]r", "Tutori]l", "S]ir"]
menu_fases = ["f]se 1","f]se 2","f]se 3"]
//qual menu esta selecionado agora
menu_atual = menu

//posso mexer nos botoes do menu?
controle = true
//posso desenhar o menu?
if (!global.transicao)
	posso_desenhar = true
else
	posso_desenhar = false
	
//terminei a animação de entrada
terminei = false

//sairem da room com efeito
modi = -700
//qual botão esta selecionado
atual = 0
//fazer o botão selecionado ir pra frente
margem = 20

pra_tras = function()
{
	tween(id,"modi",-700,tween_animation.back_in,20)	
}
pra_frente = function()
{
	tween(id,"modi",0,tween_animation.quint_out,70)	
}

pro_jogo = function(_dificuldade = 1)
{
	var _roomx = room_width
	var _roomy = room_height/2
	troca_mapa(rm_jogo,_roomx,_roomy)
	global.dificuldade = _dificuldade
	pra_tras()	
}

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
	
	//para debug, mudar o menu atual
	if keyboard_check_pressed(vk_escape)
	{
		if (menu_atual == menu_fases)
		{
			menu_atual = menu
		}
		else
		{
			menu_atual = menu_fases	
		}
	}
	
	#region transicoes
	
	if (keyboard_check_pressed(vk_enter))
	{
		var _roomx = room_width
		var _roomy = room_height/2
		if(menu_atual == menu)
		{
			//se for o menu normal
			switch(atual)
			{
				case 0://jogar
					menu_atual = menu_fases
					som(snd_zap,,1,1,0.1)
				break;
				
				case 1://tutorial
					troca_mapa(rm_tutoriala,_roomx,_roomy)
					pra_tras()
					global.dificuldade = 0
					transOn()
				break;
				
				case 2://sair
					game_end()
				break;
			}
			
		}
		else
		{
			//se for o menu fases
			switch(atual)
			{
				case 0://fase 1
					pro_jogo(1)
				break;
				
				case 1://fase 2 
					if(global.fases_desbloqueadas >= 1)
					{
						pro_jogo(2)
					}
					else
						som(snd_erro,0,1,1,.05,2)
				break;
				
				case 2://fase 3
					if(global.fases_desbloqueadas >= 2)
					{
						pro_jogo(3)
					}
					else
						som(snd_erro,0,1,1,.05,2)
				break;
			}
			
		}
		
	}
	
	#endregion
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

	//desenhar as opções e marcar a opção selecionada 
	for (var i = 0; i < array_length(menu_atual); ++i) 
	{
		
		var _frent = 0
		var _cor = c_white
		
		//chegar os bloqueados
		if (i > global.fases_desbloqueadas && menu_atual == menu_fases)
		{
			_cor = c_dkgray
		}
		//opcao selecionada
		if (atual == i) 
		{
			_frent = margem
			_cor = c_red
			//se eu estiver no menu de fases
			if (i > global.fases_desbloqueadas && menu_atual == menu_fases)
			{
				_cor = c_gray	
			}
		}
		
	
		draw_set_colour(_cor)
	    draw_text(20+_frent+modi,_meio + i*_alt*0.8,menu_atual[i])
		draw_set_color(-1)
	}


	//resetando sets
	draw_set_valign(0)
	draw_set_font(-1)	
	
	#endregion
	
	
}