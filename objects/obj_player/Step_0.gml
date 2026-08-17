///@description 

//tempo do tiro


controla_player();

if (keyboard_check_pressed(ord("1")))
{
	lv_tiro--;
	lv_tiro = clamp(lv_tiro,1,5)
	
}
if (keyboard_check_pressed(ord("3"))) 
{
	lv_tiro++;
	lv_tiro = clamp(lv_tiro,1,5)
}

if(keyboard_check_pressed(vk_tab)) global.debug = !global.debug