//@description

//criando primeira onda
onda_atual = noone
onda = 0
ondas = [sq_onda1,sq_onda1b,sq_onda2]

alarm[0] = 100

var _tamanho = array_length(ondas)
for (var i = 0; i < _tamanho; ++i) 
{
    var _onda = sequence_get(ondas[i])
	_onda.loopmode = 0
}