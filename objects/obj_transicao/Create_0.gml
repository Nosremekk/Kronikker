/// @description variaveis

//-----Transição Celeste

tamanho = sprite_get_width(spr_quadrado_transicao);

cols =  ceil(view_get_wport(0)/tamanho)//Colunas
linhas = ceil(view_get_hport(0)/tamanho) // linhas

//Variaveis para a animação da sprite
img = 0;//Qual imagem utilizarei?

img_vel =  sprite_get_speed(spr_quadrado_transicao) / game_get_speed(gamespeed_fps); // Velocidade

img_num = sprite_get_number(spr_quadrado_transicao) - 1;


//----- Variaveis para troca de room

destino = rm_level1_cronica2;
tipo = 1;

entrando = true;

//-----Fade in - Fade out
alpha = 0;
inicio = false;

//Fazendo o sistema de porta
x_player = 0;
y_player = 0;
mexe_posicao = false;
dash_inicial = false;
dir_inicial = 0;

//Pausando o jogo
global.pause = true;