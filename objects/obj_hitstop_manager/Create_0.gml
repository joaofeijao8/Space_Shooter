///@description

timer_hitstop = 0

desfaz_hitstop = function()
{
    if (!global.hitstop)
    { 
        return
    }
    
    timer_hitstop--;
    
    with(all)
    {
        image_speed = 0
    }
    
    if (timer_hitstop <= 0)
    {
        global.hitstop = false
            with(all)
        {
            image_speed = 1
        }
    }
    
}