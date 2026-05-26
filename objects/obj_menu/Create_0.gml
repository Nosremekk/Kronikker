/// @description iniciando as variaveis
kronikker = layer_background_get_id("kronikker");
layer_background_alpha(kronikker,0)

tree = layer_background_get_id("tree");
layer_background_alpha(tree,0)

sky = layer_background_get_id("sky");
layer_background_alpha(sky,0)



alpha_kronikker = 0;
alpha_tree = 0;
alpha_sky = 0;
alpha_texto = 0

//Variaveis do rebind
movimentacao = "SETAS";
pulo = "Z";
dash = "X";
replay = "C";


padrao_bind = false
configurando = false;

//Opcoes  

opcoes[0][0] = "INICIAR JOGO";
opcoes[0][1] = "CONFIGURAR";
opcoes[0][2] = "CREDITOS";
opcoes[0][3] = "FECHAR JOGO";

opcoes[1][0] = "CONTROLES";
opcoes[1][1] = "SOM";
opcoes[1][2] = "MODO TELA CHEIA";
opcoes[1][3] = "VOLTAR";

opcoes[2][0] = "MUSICA:" + string(global.volume)
opcoes[2][1] = "EFEITOS SONOROS:" + string(global.volume_efeitos_sonoros)
opcoes[2][2] = "DIALOGO:" + string(global.volume_dialogos)
opcoes[2][3] = "VOLTAR"

opcoes[3][0] = "MOVIMENTAÇÂO:" + movimentacao;
opcoes[3][1] = "PULO:" + pulo;
opcoes[3][2] = "DASH:" + dash;
opcoes[3][3] = "REPLAY:" + replay;
opcoes[3][4] = "VOLTAR";
//Index e qual menu usar
index = 0;
tipo_menu = 0;
checar = true;

//Efeitos no texto
texto_escala = 1;
texto_angulo = 1;
controla_angulo = 0;

//Quantas opçoes eu tenho?
qtd_opcoes = array_length(opcoes[tipo_menu]);

//Configurando tela cheia
tela_cheia = true;

//Metodos

//----Rebind
rebind_move = function()
{
	var _i = obj_input; //só facilitando ficar digitando muito chato meu Deus
	var _up,_down,_right,_left,_escolhi;

	_up =		global.input[global.tipo_controle][CONTROLE.UP_MENU]
	_down =		global.input[global.tipo_controle][CONTROLE.DOWN_MENU]
	_escolhi =	global.input[global.tipo_controle][CONTROLE.JUMP];

	_left =  global.input[global.tipo_controle][CONTROLE.LEFT_MENU]
	_right = global.input[global.tipo_controle][CONTROLE.RIGHT_MENU]
	
		if (index == 0) and ((_left) or (_right)	) //Movimentação
		{
			if (movimentacao == "SETAS") 
			{
				movimentacao = "WASD";
				pulo = "J";
				dash = "K";
				replay = "L";
				padrao_bind = true;
			}
			else 
			{
				movimentacao = "SETAS";
				pulo = "Z";
				dash = "X";
				replay = "C";
				padrao_bind = true;
			}
		}	
	
}

rebind_jump = function()
{
	var _i = obj_input; //só facilitando ficar digitando muito chato meu Deus
	var _up,_down,_right,_left,_escolhi;

	_up =		global.input[global.tipo_controle][CONTROLE.UP_MENU]
	_down =		global.input[global.tipo_controle][CONTROLE.DOWN_MENU]
	_escolhi =	global.input[global.tipo_controle][CONTROLE.JUMP];

	_left =  global.input[global.tipo_controle][CONTROLE.LEFT_MENU]
	_right = global.input[global.tipo_controle][CONTROLE.RIGHT_MENU]
	
		if (index == 1)
		{
			if (_escolhi) and (!configurando) configurando = true;
		
			if (configurando)
			{
				if (keyboard_check_pressed(vk_anykey)) 
				{
					var _bind = string_upper(keyboard_lastchar)
				
					if (_bind != dash) and (_bind != replay)
					{
						if ((movimentacao == "WASD") and (_bind != "A") and (_bind != "S") and (_bind != "D") and (_bind != "W")) or (movimentacao == "SETAS")
						pulo = keyboard_lastchar;
						pulo = string_upper(pulo);
						padrao_bind = true;
					}
				
					configurando = false;
					
				}
			}
		}
	
}

rebind_dash = function()
{
	var _i = obj_input; //só facilitando ficar digitando muito chato meu Deus
	var _up,_down,_right,_left,_escolhi;

	_up =		global.input[global.tipo_controle][CONTROLE.UP_MENU]
	_down =		global.input[global.tipo_controle][CONTROLE.DOWN_MENU]
	_escolhi =	global.input[global.tipo_controle][CONTROLE.JUMP];

	_left =  global.input[global.tipo_controle][CONTROLE.LEFT_MENU]
	_right = global.input[global.tipo_controle][CONTROLE.RIGHT_MENU]
	
	if (index == 2)
	{
		if (_escolhi) and (!configurando) configurando = true;
		
		if (configurando)
		{
			if (keyboard_check_pressed(vk_anykey)) 
			{
				var _bind = string_upper(keyboard_lastchar)
				
				if (_bind != pulo) and (_bind != replay)
				{
					if ((movimentacao == "WASD") and (_bind != "A") and (_bind != "S") and (_bind != "D") and (_bind != "W")) or (movimentacao == "SETAS")
					{
						dash = keyboard_lastchar;
						dash = string_upper(dash);
						padrao_bind = true;
					}
				}
				configurando = false;
			}
		}
	}	
}

rebind_replay = function()
{
	
	var _i = obj_input; //só facilitando ficar digitando muito chato meu Deus
	var _up,_down,_right,_left,_escolhi;

	_up =		global.input[global.tipo_controle][CONTROLE.UP_MENU]
	_down =		global.input[global.tipo_controle][CONTROLE.DOWN_MENU]
	_escolhi =	global.input[global.tipo_controle][CONTROLE.JUMP];

	_left =  global.input[global.tipo_controle][CONTROLE.LEFT_MENU]
	_right = global.input[global.tipo_controle][CONTROLE.RIGHT_MENU]
	
	if (index == 3)
	{
		if (_escolhi) and (!configurando) configurando = true;
		
		if (configurando)
		{
			if (keyboard_check_pressed(vk_anykey)) 
			{
				var _bind = string_upper(keyboard_lastchar)
				
				if (_bind != pulo) and (_bind != dash)
				{
					if ((movimentacao == "WASD") and (_bind != "A") and (_bind != "S") and (_bind != "D") and (_bind != "W")) or (movimentacao == "SETAS")
					{
						replay = keyboard_lastchar;
						replay = string_upper(replay);				
						padrao_bind = true;
					}
				configurando = false;
				}
			}
		}
	}	
}



