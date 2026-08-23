///@description

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