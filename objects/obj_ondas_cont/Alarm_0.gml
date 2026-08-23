//@description

if(numero_onda < array_length(fase_atual))
{
	sq_atual = layer_sequence_create("inimigo",0,0,fase_atual[numero_onda])
	next = false
}
else
{
	show_debug_message("INICIAR BOSS")
	global.boss = 1
}	




