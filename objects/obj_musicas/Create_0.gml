///@description
 
posso_abaixar = false
msc_atual = noone

abaixa_volume = function()
{
	audio_sound_gain(msc,0,700)
}

aumenta_volume = function()
{
	audio_sound_gain(msc,1,700)
}