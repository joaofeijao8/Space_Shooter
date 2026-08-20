///@description 

//controle pra se movimentar
controla_player();



//botar escudo na minha posição
if (instance_exists(meu_escudo))
{
	meu_escudo.x = x
	meu_escudo.y = y
}else meu_escudo = noone

// estou invencivel, quando tomo dano
if(timer_invencivel > 0)
{
	image_alpha = 0.6	
}
else
{
	image_alpha = 1	
}
	
//mostrar lv da arma: tab
if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug