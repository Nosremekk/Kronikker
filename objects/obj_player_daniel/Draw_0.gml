/// @description Desenhos
if (global.pause) velocidade_anim = 0;
else velocidade_anim = 10/room_speed;





//Desenhando o timer
//if (global.toreplay) or ((controle_volta > 0) and (obj_replay.limite_replay < global.limite_global)) desenha_timer();

//Desenhando minha sprite com a escala atualizada

ajusta_sprite();

draw_sprite_ext(anim_atual,image_ind,x,y,xscale * ver,yscale,image_angle,image_blend,image_alpha);


// Olhando
if (velh != 0) ver = sign(velh);

//Mudando conforme a vestimenta
if (!global.armadura)
{
	idle = spr_leon_idle;
	walk = spr_leon_walk;
	jump = spr_leon_jump;
	fall = spr_leon_fall;
}
else
{
	idle = spr_leon_armadura_idle;
	walk = spr_leon_armadura_walk;
	jump = spr_leon_jump;
	fall = spr_leon_fall;
}

//Controlando as sprites
controla_sprite(idle,walk,jump,fall,fall,spr_leon_wall,spr_leon_dash,spr_leon_armadura_dash_up,idle,idle)

if (anim_atual != spr_index)
{
	image_numb = 0;
	anim_atual = spr_index;
}



//Caso eu esteja sem armadura eu não posso dar dash
if (!global.armadura) duracao_total = 0;
else duracao_total = room_speed/7.5;






