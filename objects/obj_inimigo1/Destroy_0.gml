///@description drops
 var _chance = random(100)
 
if(_chance >= 90)
{
	instance_create_layer(x,y,"PowerUp",obj_powerUp)	
}

tremer(2)
som(snd_boom)