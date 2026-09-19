///@description
if(devo_sumir == true)
	alarm[0] = global.segundos * 7
image_alpha = 1
piscando = false
sumindo = true
subindo = true
yy = y
y = yy + 5

pisca_some = function()
{
	tween(id,"image_alpha",0,tween_animation.linear,30)	
}

pisca_aparece = function()
{
	tween(id,"image_alpha",1,tween_animation.linear,30)
}

sumirei = function()
{
	if (piscando)
	{
		if (sumindo)
		{
			pisca_some()	
		}
		else
		{
			pisca_aparece()	
		}
		
	}
	
	if (image_alpha == 1)
	{
		sumindo = true	
	}
	else if (image_alpha < 0.1)
	{
		sumindo = false
	}	
}

flutuar = function()
{
	var _efeito = tween_animation.sine_inout
	var _mod = 3
	if (subindo)
	{
		tween(id,"y",yy-_mod,_efeito)
	}
	else
	{
		tween(id,"y",yy+_mod,_efeito)
	}
	
	if (y == yy-_mod)
		subindo = false
	
	else if (y == yy+_mod)
		subindo = true
}