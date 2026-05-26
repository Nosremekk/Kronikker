/// @description Desenhos
//Desenhando minha sprite com a escala atualizada

ajusta_sprite();

draw_sprite_ext(anim_atual,image_ind,x,y,xscale * ver,yscale,image_angle,image_blend,image_alpha);

// Olhando
if (velh != 0) ver = sign(velh);


//Controlando as sprites
controla_sprite(spr_girl_color_idle,spr_girl_color_walk,spr_girl_color_jump,spr_girl_color_fall,spr_girl_color_fall_complete,spr_girl_color_wall,spr_girl_color_dash,spr_girl_color_dash,spr_player,spr_player)

if (anim_atual != spr_index)
{
	image_numb = 0;
	anim_atual = spr_index;
}


