

function cria_particulas(_x = 0, _y = 0, _velv = 0, _velh = 0)
{
    if(!instance_exists(obj_part_mangaer))
    {
        instance_create_depth(0,0,0,obj_part_mangaer)
    }
    
    with(obj_part_mangaer)
    {
        var _qnt = irandom_range(10,50)
        
        repeat(_qnt)
        {
            var _part = instance_create_layer(_x,_y,"particulas",obj_part_linha)
            _part.velh = _velh
            _part.velv = _velv
        }   
    }
}