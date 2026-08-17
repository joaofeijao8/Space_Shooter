///@description 

if (global.debug){
	draw_text(20,20,"tiro "+string(lv_tiro))
}

var _gui_height = display_get_gui_height()

//vida do player
desenha_icone(spr_vida_ico,vida,,_gui_height-80)

//escudo player
desenha_icone(spr_escudo_ico,escudo,24,_gui_height-30)

//fim
