//@description

//criando primeira onda
onda_atual = noone
next = true
ondas = [sq_onda1,sq_onda1b,sq_onda2]

//fazendo as sequence looparem (caso necessario apenas)
var _tamanho = array_length(ondas)
for (var i = 0; i < _tamanho; ++i) 
{
    var _onda = sequence_get(ondas[i])
	_onda.loopmode = 1
}

alarm[0] = 100
