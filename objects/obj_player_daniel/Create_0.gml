/// @description Variaveis 
grav = .3;
acel_chao = .15;
acel_ar = .07;
acel = acel_chao;
deslize = 2;



//-----Velocidades
velh = 0;
velv = 0;

//-----Limites das velocidades
max_velh = 5;
max_velv = 7;

//Bonus para o pulo
timer_pulei = 2;
pulei = false;
limite_pulo = 6;
timer_pulo = limite_pulo;

limite_buffer = 6;
timer_queda = 0;
buffer_pulo  = false;

limite_parede = 6;
timer_parede = 0;

//-----Variaveis de controle
chao = false;
xscale = 1;
yscale = 1;
parede_dir = false;
parede_esq = false;
ultima_parede = 0;
ver = 1;

npc = noone;
dialogo_criado = noone;

//Se eu estou em um trampolim eu posso pular mais alto
trampolim = false;
mola = false;
boost = 1;

//Morte
morreu = false;

//--Controle do dash
duracao_total = room_speed/7;
dura_dash = duracao_total;//Duração do dash
dir = 0;//Direção do dash
len = 9;//Limite do dash
carga = global.limite_dash;//Quantidade de dash que o mano pode dar
limite_carga = global.limite_dash;//Nome auto-evidente
dash_inicial = false;

tempo_ataque = duracao_total * 1.75;
cancela_ataque = false;

dir_inicial = 0;
guarda_dash = dash_inicial;
guarda_dir = dir_inicial;


pulei_dash = false;



//---Controle estetico

//--Controle de sprite
//Mudando conforme a vestimenta

if (!global.armadura)
{
	idle = spr_leon_idle
	walk = spr_leon_walk;
	jump = spr_leon_jump;
	fall = spr_leon_fall
}
else
{
	idle = spr_leon_armadura_idle;
	walk = spr_leon_armadura_walk;
	jump = spr_leon_jump;
	fall = spr_leon_fall
}

//Variaveis de controle da sprite
spr_index = idle;
anim_atual = spr_index;
velocidade_anim = 10/room_speed;
image_ind = 0;
image_numb = 0;

sat = 255;//Saturação maxima


controle_volta = 0;

estado = state.parado;

//Criando o meu replay
if (!instance_exists(obj_replay)) instance_create_layer(0,0,layer,obj_replay);

//-----Funções
//--Função Cria poeira

cria_poeira = function(_parede,_chance)
{
	if (_chance > 94)
		{
		if (!_parede)
		{
			for (var i = 0; i < random_range(5,11); i++)
			{
				var _xx = random_range(x-sprite_width,x+sprite_width);
		
				instance_create_layer(_xx,y,layer,obj_vel);
		
			}
		}
		else
		{
			for (var i = 0; i < random_range(5,11); i++)
			{
				var _onde = parede_dir - parede_esq;
				var _xx = x + _onde * sprite_width/2;
				var _yy = y + random_range(-sprite_height/4,0);
		
				instance_create_layer(_xx,y,layer,obj_vel);
		
			}
		}
	}
}

//-- Ajuste da sprite

ajusta_sprite = function()
{
	image_numb = sprite_get_number(spr_index);
	image_ind += velocidade_anim;
	
	image_ind %= image_numb;
	
}

//-- Desenha barra de tempo
desenha_timer = function()
{
var _y = y - (62*yscale)	

	
draw_set_color(c_black);
draw_rectangle(x-16,_y,x+16,_y,true);
draw_set_color(-1);
if (!recuperacao_total) draw_set_color(c_blue);
else draw_set_color(c_orange);
draw_rectangle(x-16,_y,x-16+(obj_replay.limite_replay/global.limite_global * 32),_y,false);
draw_set_color(-1);	
}

//verificando x e y para quando eu reviver
x_player = 0;
y_player = 0;

//criando a navi
layer_create(-2,"navi")
navi = instance_create_layer(x,y-32,"navi",obj_navi)
navi.pai = self;

//Começando com armadura
global.armadura = true;