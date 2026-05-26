/// @description Insert description here
// You can write your code in this editor
//Alpha do background
if (alpha_sky < 1) alpha_sky += .02;

if (alpha_tree < 1) and (alpha_sky >= 1) alpha_tree += .02;

if (alpha_kronikker < 1) and (alpha_tree >= 1) alpha_kronikker += .02;

layer_background_alpha(kronikker,alpha_kronikker)
layer_background_alpha(tree,alpha_tree)
layer_background_alpha(sky,alpha_sky)

if (instance_exists(obj_transicao)) or (alpha_kronikker < 1) exit;

var _up,_down,_right,_left,_escolhi;

_up =		global.input[global.tipo_controle][CONTROLE.UP_MENU]
_down =		global.input[global.tipo_controle][CONTROLE.DOWN_MENU]
_escolhi =	global.input[global.tipo_controle][CONTROLE.JUMP];

_left =  global.input[global.tipo_controle][CONTROLE.LEFT_MENU]
_right = global.input[global.tipo_controle][CONTROLE.RIGHT_MENU]

if (_up)
{
	if (index <= 0) index = qtd_opcoes-1;
	else index--;
	
	texto_escala = 0;
}

if (_down)
{
	if (index >= qtd_opcoes-1) index = 0;
	else index++;
	
	texto_escala = 0;
}



//Escolhendo o nivel

//Verificando se eu apertei enter e o que eu devo fazer
if (_escolhi) // apertei enter
{
	switch(tipo_menu)
	{
		#region Primeiro Menu(Iniciar jogo, configurar, creditos, fechar jogo)
		case 0: //Iniciar jogo, configurar, creditos, fechar jogo
		
		if (index == 0) transicao(rm_casa_cronica2,NUMEROTRANSICAO.ESCURECENDO)
		
		
		else if (index == 1) 
		{
			tipo_menu = 1;
			index = 0;
			
			if (instance_exists(obj_input)) tela_cheia = obj_input.tela_cheia;
		}
		
		
		else if (index == 3) game_end();
		
		break;
		#endregion
		
		
		#region Segundo menu(Controles, Som, Tela Cheia, Voltar)
		
		case 1: //Controles, Som, Tela Cheia, Voltar
		
		if (index == 0) 
		{
			tipo_menu = 3;
			index = 0;
			
			//Quantas opçoes eu tenho?
			qtd_opcoes = array_length(opcoes[tipo_menu]);
		}
		
		else if (index == 1) 
		{
			tipo_menu = 2;
			index = 0;
		}
		
		else if (index == 2)
		{
			tela_cheia = !tela_cheia;
			
			window_set_fullscreen(tela_cheia);
			
			if (instance_exists(obj_input)) obj_input.tela_cheia = tela_cheia;
		}
		
		else if (index == 3) 
		{
			index = 0;
			tipo_menu = 0;
		}
		break;
		
		#endregion
		
		#region Terceiro Menu(Musica, Efeitos Sonoros, Dialogo
		case 2: // Terceiro Menu(Musica, Efeitos Sonoros, Dialogo
		
		if (index == 3)
		{
			index = 0;
			tipo_menu = 1;
		}
		
	
		break;
		#endregion
		
		#region Quarto Menu(Rebind dos controles)
		
		case 3:
		
		if (index == 4)
		{
			index = 0;
			tipo_menu = 1;
			
			//Configurando as modificoes
			var _i = obj_input;
			
			if (movimentacao == "SETAS")
			{
				_i.left_keyboard = vk_left;	
				_i.right_keyboard = vk_right;	
				_i.up_keyboard = vk_up;	
				_i.down_keyboard = vk_down;	
			}
			else
			{
				_i.left_keyboard = ord("A");	
				_i.right_keyboard = ord("D");	
				_i.up_keyboard = ord("W");	
				_i.down_keyboard = ord("S");	
			}
			
			_i.jump_keyboard = ord(pulo);
			_i.dash_keyboard = ord(dash);
			_i.replay_keyboard = ord(replay);
			
			_i.movimentacao = movimentacao;
			_i.pulo = pulo;
			_i.dash = dash;
			_i.replay = replay;
			
			//Quantas opçoes eu tenho?
			qtd_opcoes = array_length(opcoes[tipo_menu]);
		}
			
		
		
		
		break;
		
		#endregion
		
	}
}


//Configurando a modificação de som
if (tipo_menu == 2 and index < 3)
{
	if (_left)
	{
		if (index == 0) and (global.volume > 0) global.volume -= 1;
		else if (index == 1) and (global.volume_efeitos_sonoros > 0) global.volume_efeitos_sonoros -= 1;
		else if (index == 2)  and (global.volume_dialogos > 0)global.volume_dialogos -= 1;
	}
	
	if (_right)
	{
		if (index == 0) and (global.volume < 10) global.volume += 1;
		else if (index == 1) and (global.volume_efeitos_sonoros < 10) global.volume_efeitos_sonoros += 1;
		else if (index == 2)  and (global.volume_dialogos < 10) global.volume_dialogos += 1;
	}
	
	opcoes[2][0] = "MUSICA:" + string(global.volume)
	opcoes[2][1] = "EFEITOS SONOROS:" + string(global.volume_efeitos_sonoros)
	opcoes[2][2] = "DIALOGO:" + string(global.volume_dialogos)
	
}

//Configurando texto
if (!tela_cheia) opcoes[1][2] = "MODO TELA CHEIA";
else opcoes[1][2] = "MODO JANELA";

if (instance_exists(obj_input) and tipo_menu != 3)
{
	movimentacao = obj_input.movimentacao;
	pulo = obj_input.pulo;
	dash = obj_input.dash;
	replay = obj_input.replay;	
}

//Configurando o rebind de controle
if (tipo_menu == 3 and index < 4)
{
	
	rebind_move();
	
	rebind_jump();
	
	rebind_dash();
	
	rebind_replay();
	
	
	opcoes[3][0] = "MOVIMENTAÇÂO:" + movimentacao;
	opcoes[3][1] = "PULO:" + pulo;
	opcoes[3][2] = "DASH:" + dash;
	opcoes[3][3] = "REPLAY:" + replay;
	
	if (padrao_bind) opcoes[3][4] = "SALVAR E SAIR";
	else opcoes[3][4] = "VOLTAR";
}


