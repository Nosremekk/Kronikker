// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

global.toreplay = false
//global.index_desfazendo = 0 | modificado pois causa memory leak
global.limpeza = false;

global.limite_global = 120;
global.limite_dash = 1;

global.cristal = 0; //Quantidade de cristal

function scr_replay(_x,_y,_image,_sprite,_xscale,_yscale,_ver,_carga) constructor
{
	x = _x;
	y = _y;
	xscale = _xscale;
	yscale = _yscale;
	spr_index = _sprite;
	image_ind = _image;
	ver = _ver;
	carga = _carga;
}

function serra_volta(_x,_y,_rot) constructor
{
	x = _x
	y = _y;
	image_angle = _rot
}

function plataforma_volta(_x,_y,_velh,_velv,_para) constructor
{
	x = _x;
	y = _y;
	velh = _velh;
	velv = _velv;
	parar = _para;
}

function corrente_volta(_angulo) constructor
{
	angulo = _angulo;	
}

function inimigo_volta(_x,_y,_xscale,_yscale,_sprite,_image_ind,_estado) constructor
{
	x = _x;
	y = _y;
	image_xscale = _xscale;
	image_yscale = _yscale ;
	sprite_index = _sprite;
	image_index = _image_ind;
	estado = _estado;
}

function trampolim_volta(_sprite,_image,_check,_timer,_botao,_boost) constructor
{
	sprite_index = _sprite;
	image_index = _image;
	check_anim = _check
	timer_tramp = _timer;
	botao_tramp = _botao;
	boost = _boost;
}

function plataforma_cai_volta(_queda,_col,_volta,_voltando,_alpha,_spr) constructor
{
	timer_queda = _queda
	col_player = _col

	timer_volta = _volta;
	voltando = _voltando;
	
	image_alpha = _alpha;
	sprite_index = _spr;
	
}

function navi_volta(_pai,_lado,_x,_y) constructor
{
	pai = _pai
	lado = _lado
	x = _x
	y = _y
}

function power_up_volta(_sumir,_pode_s,_pode_ap,_alfa,_loop) constructor
{
	sumir = _sumir
	pode_sumir = _pode_s
	pode_aparecer = _pode_ap
	image_alpha = _alfa
	loop = _loop
}