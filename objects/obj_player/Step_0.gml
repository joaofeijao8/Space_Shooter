///@description 

//controle pra se movimentar
controla_player();

//diminuir lv da arma: 1 
if (keyboard_check_pressed(ord("1")))
{
	lv_tiro--;
	lv_tiro = clamp(lv_tiro,1,5)
	
}
//aumentar lv da arma: 2 
if (keyboard_check_pressed(ord("2"))) 
{
	lv_tiro++;
	lv_tiro = clamp(lv_tiro,1,5)
}
//levar dano: enter
if (keyboard_check_pressed(vk_enter))
{
	perde_vida()
}
//usar escudo
if (keyboard_check_pressed(ord("E")))
{
	usa_escudo()
}

//botar escudo na minha posição
if (instance_exists(meu_escudo))
{
	meu_escudo.x = x
	meu_escudo.y = y
}else meu_escudo = noone

if(timer_invencivel > 0)
{
	image_alpha = 0.8	
}
else
{
	image_alpha = 1	
}
	
//mostrar lv da arma: tab
if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug