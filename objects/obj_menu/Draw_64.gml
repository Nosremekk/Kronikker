/// @description Desenhando as opçoes
if (instance_exists(obj_transicao)) or (alpha_kronikker < 1) exit;

if (alpha_texto < 1) alpha_texto += .05
for (var _i = 0; _i < qtd_opcoes; _i++;)
{
	//var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+- ",true,5);
	draw_set_font(fnt_dialogo);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	var _x = view_get_wport(0)/2;
	var _y = 720/2 + (_i * 32);
	
	if (_i == index)
	{
		texto_escala = lerp(.5,5,.01) ;
	}
	else 
	{
		texto_escala = .5;
	}
	draw_set_alpha(alpha_texto)
	
	draw_text_transformed(_x,_y,opcoes[tipo_menu,_i],texto_escala,texto_escala,image_angle);
	
	draw_set_halign(-1);
	draw_set_valign(-1);
	draw_set_font(-1);
	draw_set_alpha(1)
	draw_set_color(c_white);
	//font_delete(_font);
}



