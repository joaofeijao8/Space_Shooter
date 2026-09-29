///@description

desfaz_hitstop();

if(keyboard_check_pressed(vk_enter))
{
    
    global.hitstop = true;
    timer_hitstop = 15;
}