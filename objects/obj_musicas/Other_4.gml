///@description
 


audio_stop_all()

switch(room)
{
	case rm_jogo:
		msc_atual = snd_musica_luta
		break;
		
	case rm_inicio:
		msc_atual = snd_musica_menu
	break;
	
	case rm_tutoriala:
		msc_atual = snd_musica_tutorial
	break;
	
}

msc = audio_play_sound(msc_atual,0,1,1)
//aumenta_volume()
