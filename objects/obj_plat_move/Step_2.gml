/// @description Insert description here
// You can write your code in this editor
//Trampolim
if (trampolim)
{
	if (meu_trampolim == noone) meu_trampolim = instance_create_layer(x+sprite_width/2,y+1,layer,obj_trampolim);
	meu_trampolim.x = x+sprite_width/2;
	meu_trampolim.y = y+1;
}

