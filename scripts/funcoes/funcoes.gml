global.controle = -1;
global.tipo_controle = 0;

window_set_fullscreen(true);
window_set_cursor(cr_none);

//Plataformas destrutiveis
global.plat_destroi[0] = false;
global.plat_destroi[1] = false;
global.plat_destroi[2] = false;
global.plat_destroi[3] = false;
global.plat_destroi[4] = false;
global.plat_destroi[5] = false;

//Volume
global.volume = 10;
global.volume_efeitos_sonoros = 10;
global.volume_dialogos = 10;

//Estatisticas
global.cronometro = 0;
global.mortes = 0;



//-----Definindo os inputs-----
enum CONTROLE
{
	LEFT,
	RIGHT,
	UP,
	DOWN,
	JUMP,
	JUMP_S,
	DASH,
	REPLAY,
	JUMP_IN,
	UP_MENU,
	DOWN_MENU,
	PAUSE,
	LEFT_MENU,
	RIGHT_MENU
}

//--Teclado

global.input[0][CONTROLE.LEFT] = keyboard_check(vk_left);
global.input[0][CONTROLE.RIGHT] = keyboard_check(vk_right);
global.input[0][CONTROLE.UP] = keyboard_check(vk_up);
global.input[0][CONTROLE.DOWN] = keyboard_check(vk_down);
global.input[0][CONTROLE.JUMP] = keyboard_check_pressed(ord("Z"));
global.input[0][CONTROLE.JUMP_S] = keyboard_check_released(ord("Z"));
global.input[0][CONTROLE.JUMP_IN] = keyboard_check(ord("Z"));
global.input[0][CONTROLE.DASH] = keyboard_check_pressed(ord("X"));
global.input[0][CONTROLE.REPLAY] = keyboard_check_pressed(ord("C"));
global.input[0][CONTROLE.PAUSE] = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape);

//--Controle

global.input[1][CONTROLE.LEFT]   =	gamepad_axis_value(global.controle,gp_axislh) < -0.25;
global.input[1][CONTROLE.RIGHT]  =	gamepad_axis_value(global.controle,gp_axislh) > 0.25;
global.input[1][CONTROLE.UP]     =	gamepad_axis_value(global.controle,gp_axislv) < 0.25;
global.input[1][CONTROLE.DOWN]   =	gamepad_axis_value(global.controle,gp_axislv) > -0.25;
global.input[1][CONTROLE.JUMP]   =	gamepad_button_check_pressed(global.controle,gp_face1);
global.input[1][CONTROLE.JUMP_S] =	gamepad_button_check_released(global.controle,gp_face1);
global.input[1][CONTROLE.JUMP_IN] =	gamepad_button_check(global.controle,gp_face1);
global.input[1][CONTROLE.DASH]   =	gamepad_button_check_pressed(global.controle,gp_face3);
global.input[1][CONTROLE.REPLAY] =	gamepad_button_check_pressed(global.controle,gp_face2);
global.input[1][CONTROLE.PAUSE] =	gamepad_button_check_pressed(global.controle,gp_start);


//estetica
global.armadura = false;

//Numerando as transições

enum NUMEROTRANSICAO
{
	CELESTEVERTICAL,
	CELESTEHORIZONTAL,
	ESCURECENDO
}

function funcoes(){

}


function controla_sprite(_idle,_walk,_jump,_fall_prepare,_fall,_walljump,_dash,_dash_up,_dialogando,_morte)
{
	if (global.toreplay) exit;
	var _left =		global.input[global.tipo_controle][CONTROLE.LEFT]
	var _right =	global.input[global.tipo_controle][CONTROLE.RIGHT]
	//-----Parado e andando
	
	if ((chao) and (!_left and !_right)) or ( (chao) and (_left and _right)) spr_index = _idle;
	
	if (chao) and (_left or _right) and !(_left and _right) spr_index = _walk;
	
	//-----Verificando Pulo
	if (estado == state.movendo) and (!chao) and (!parede_esq and !parede_dir) and (velv < 0)
	{	
		spr_index = _jump;
		
	}
	else if (estado == state.movendo) and (!chao) and (!parede_esq and !parede_dir) and (velv > 0) 
	{
		if (spr_index != _fall_prepare) spr_index = _fall;
		
		if (spr_index == _fall) and (image_ind >= image_numb-1) spr_index = _fall_prepare;
	}
	
	//-----Walljump, dash e outros
	
	if (estado = state.movendo) and (!chao) and (parede_esq or parede_dir) spr_index = _walljump;
	
	if (estado = state.dash) 
	{
		if (dir == 90) spr_index = _dash_up;
		else if (dir == 270) spr_index = _jump
		else spr_index = _dash;
		
	}
	if (estado = state.dialogo) spr_index = _dialogando;
	if (estado = state.morte) spr_index = _morte;
	
	
	
	//Colocando sons com base na mudança de sprite
	/*
    if (anim_atual != spr_index)
    {
        switch(spr_index)
        {
            case _jump:
            audio_play_sound(snd_teste3,1,false);
            break;
            case _dash:
            audio_play_sound(snd_teste,1,false);
            break;
            case _fall:
            audio_play_sound(snd_teste2,1,false);
            break;
        }
    }
*/

}
	








//Função de transição
function transicao(_destino,_tipo = NUMEROTRANSICAO.CELESTEHORIZONTAL,_x = 0,_y = 0,_foitransicao = false,_dash = false,_dir = 0)
{	
	var _transicao = instance_create_layer(x,y,layer,obj_transicao);
	_transicao.destino = _destino;
	_transicao.tipo = _tipo;
	
	_transicao.x_player = _x;
	_transicao.y_player = _y;
	_transicao.mexe_posicao = _foitransicao;
	_transicao.dash_inicial = _dash;
	_transicao.dir_inicial = _dir;
}

//Função para morte
function morte_explosao(_obj = obj_explosao,_explodiu = false, _qtd = 8,_spd = 15/2,_spr = spr_morte_leon)
{	
	if (!_explodiu)
	{
			for (var _i = 0; _i < _qtd; _i++)
			{
				var _poeira = instance_create_layer(x,y,layer,_obj)
				_poeira.direction = _i* (360/_qtd)
				_poeira.speed = _spd
				_poeira.sprite_index = _spr;
				
			}
		_explodiu = true;
	}
}

//Função para excluir os dados 
function limpeza_temporal(_var)
{
	/*
	for (var _i = 0; _i < array_length(_var); _i++;)
	{
		delete _var[_i];
		array_delete(_var,_i,array_length(_var));
	}	
     * */

}

//Função para mostrar o titulo ou algo legal na tela
function desenha_titulo(_titulo)
{
	var _alpha = alpha;
	var _x = view_get_wport(0)/ 2;
	var _y = view_get_hport(0) / 2;
	
	var _font = font_add_sprite_ext(spr_font,"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789.,:?!()+- ",true,5);
	draw_set_font(_font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	draw_text_ext_transformed_color(_x,_y,_titulo,32,640,1.35,1.35,0,c_white,c_white,c_white,c_white,_alpha);
	
	if (!instance_exists(obj_transicao)) alpha -= .07;
	
	draw_set_halign(0);
	draw_set_valign(0);
	draw_set_font(-1);
	font_delete(_font);
	
	
	}
	
function InvertColors()
{
    gpu_set_blendmode_ext(bm_inv_dest_colour,bm_zero);
    
    draw_rectangle_colour(0,0,room_width,room_height,c_white,c_white,c_white,c_white,false);
    gpu_set_blendmode(bm_normal);
}

//Função de efeitos sonoros
function efeitos_sonoros(_som)
{
	audio_play_sound(_som,1,false)
	audio_sound_gain(_som,global.volume_efeitos_sonoros/10,0);	
}