///@description 

if (global.debug){
	draw_text(20,20,"tiro "+string(lv_tiro))
}

var _gui_height = display_get_gui_height()
if(!global.transicao)
{
	//vida do player
	desenha_icone(spr_vida_ico,vida,32,_gui_height-80,2,50)
	
	//escudo player
	desenha_icone(spr_escudo_ico,escudo,30,_gui_height-30,2,50)
	
	//fim
}