///@description
alarm[0] = global.segundos * 7
image_alpha = 1
piscando = false
sumindo = true

pisca_some = function()
{
	tween(id,"image_alpha",0,tween_animation.linear,30)	
}

pisca_aparece = function()
{
	tween(id,"image_alpha",1,tween_animation.linear,30)
}