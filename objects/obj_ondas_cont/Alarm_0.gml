//@description

if(numero_onda < array_length(fase_atual))
{
	global.spawn = true
	sq_atual = layer_sequence_create("inimigo",0,0,fase_atual[numero_onda])
	next = false
	
}
else
{
	if (global.boss = 0)
	{
		show_debug_message("INICIAR BOSS")
		global.boss = 1
		layer_sequence_create("vitoria",room_width/2,room_height/2,sq_vitoria)
	}
	
}	




