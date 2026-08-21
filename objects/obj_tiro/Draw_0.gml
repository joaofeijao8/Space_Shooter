///@description
 
draw_self()

gpu_set_blendmode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*2,image_yscale*1.7,image_angle,sombra,0.5)
gpu_set_blendmode(bm_normal )