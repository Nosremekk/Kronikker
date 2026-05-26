/// @description variaveis

dialogo = noone;
indice = 1;
pag = 0;
player = noone;
escala_caixa = 0;

libera_player = function()
{
	if (player)
	{
		with(player)
		{
		estado = state.parado;
		}
	}
	instance_destroy();
}


cria_dialogo = function(_dialogo)
{
	static _gui_w = display_get_gui_width()
	static _gui_h = display_get_gui_height()
	static _sprite_w = sprite_get_width(spr_dialogo_caixa);
	static _sprite_h = sprite_get_height(spr_dialogo_caixa);
	
	//Definindo a fonte
	var _font = _dialogo.fonte
	draw_set_font(_font);
	
	//convertendo a escala da sprite da caixa em porcentagem
	var _escala_x	= (_gui_w/_sprite_w) * escala_caixa;
	var _escala_y	= (_gui_h * .2) / _sprite_h;
	
	//Aumentando a escala da caixa
	if (escala_caixa <= 8.95) escala_caixa += .04
	
	if (escala_caixa > .895) escala_caixa = .9;
	
	//Variaveis temporarias
	
	var _txt = _dialogo.texto[pag];
	//var _txt_atual = string_copy(_txt, 1, indice);
	var _txt_atual = _txt
	var _txt_vel = _dialogo.txt_vel;
	var _margem = string_height("I");
	var _retrato = _dialogo.retrato[pag];
	var _retrato_escala = (_gui_h * .1) / sprite_get_height(_retrato);
	var _ret_y = _margem+sprite_get_height(_retrato*_retrato_escala)/2
	var _ret_larg = _retrato_escala * sprite_get_width(_retrato);
	var _qtd_pag = array_length(_dialogo.texto)-1;
	var _margem_caixa = 64;
	
	
	
	var _txt_tam = string_length(_txt);
	
	//Desenhando a caixa de texto
	draw_sprite_ext(spr_dialogo_caixa,0,_margem_caixa,0,_escala_x, _escala_y , 0, c_white , 1);
	
	//O codigo só funciona se a caixa cresceu o suficiente
	if (escala_caixa >= .9)
	{
		//Pulando de pagina
		if (keyboard_check_pressed(vk_space))
		{
			if (indice < _txt_tam) indice = _txt_tam 
			else if (pag < _qtd_pag)
			{
			indice = 1;
			pag++;	
			}
			else // terminou o dialogo
			{
				libera_player();
			}
		}
	
		//Aumentando o valor do indice
		if (indice <= _txt_tam) indice += _txt_vel;
	
	
	
	
	
		//Desenhando o retrato
		draw_sprite_ext(_retrato,0,_margem+_margem_caixa,_ret_y,_retrato_escala,_retrato_escala,0,c_white,1);
	
		//Desenhando o texto
	
		draw_text_scribble_ext(_margem *2 +_ret_larg+_margem_caixa, _margem, _txt_atual,_gui_w-_margem*2-_ret_larg-_margem_caixa*2,indice);
	
		draw_set_font(-1);	
	}
}





