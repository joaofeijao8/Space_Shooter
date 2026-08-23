//@description

//criando primeira onda
sq_atual = noone //qual sequencia spawnar
numero_onda = 0 //posição da onda atual
next = true //posso passar pra proxima onda?
ondas_fase1 = [sq_onda1,sq_onda1b,sq_onda2]
ondas_fase2 = [sq_onda1,sq_onda1b,sq_onda2]
ondas_fase3 = [sq_onda1,sq_onda1b,sq_onda2]
fase_atual = noone

//definindo minhas fases dependendo da dificuldade atual
switch(global.dificuldade)
{
	case 1:
		fase_atual = ondas_fase1
	break;
	
	case 2:
		fase_atual = ondas_fase2
	break;
	
	case 3:
		fase_atual = ondas_fase3
	break;
	
}
	
//começarei a spawnar em breve
alarm[0] = 100

//garantindo que as ondas estejam com o loop certo
var _tamanho = array_length(fase_atual)
for (var i = 0; i < _tamanho; ++i) 
{
    var _onda = sequence_get(fase_atual[i])
	_onda.loopmode = 1
}