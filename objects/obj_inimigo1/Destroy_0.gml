///@description drops
 var _chance = random(100)
 
if(_chance <= 10)
{
	_chance = random(100)
	if(_chance > 90)
		drop(obj_powerUp)
	else if (_chance >= 45)
		drop(obj_bonus_escudo)
	else
		drop(obj_bonus_vida)
}

tremer(2)
som(snd_boom)