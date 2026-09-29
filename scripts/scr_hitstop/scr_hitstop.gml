global.hitstop = false;

function ativa_hitstop(_tempo = 30)
{
    global.hitstop = true
    obj_hitstop_manager.timer_hitstop = _tempo
}