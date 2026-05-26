/// @description Variaveis 
grav = .3;
acel_chao = .1;
acel_ar = .07;
acel = acel_chao;
deslize = 2;



//-----Velocidades
velh = 0;
velv = 0;

//-----Limites das velocidades
max_velh = 6;
max_velv = 8;

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
boost = 1;

//Morte
morreu = false;

//--Controle do dash
duracao_total = room_speed/8.5;
dura_dash = duracao_total;//Duração do dash
dir = 0;//Direção do dash
len = 10;//Limite do dash
carga = 1;//Quantidade de dash que o mano pode dar
limite_carga = 1;//Nome auto-evidente
dash_inicial = false;

dir_inicial = 0;
guarda_dash = dash_inicial;
guarda_dir = dir_inicial;


pulei_dash = false;


//---Controle estetico

//--Controle de sprite
spr_index = sprite_index;
anim_atual = spr_index;
velocidade_anim = 7/room_speed;
image_ind = 0;
image_numb = 0;



sat = 255;//Saturação maxima


enum state
{
	parado,movendo,dash,morte,dialogo
}

estado = state.parado;

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
		
				instance_create_depth(_xx,y,depth-1000,obj_vel);
		
			}
		}
		else
		{
			for (var i = 0; i < random_range(5,11); i++)
			{
				var _onde = parede_dir - parede_esq;
				var _xx = x + _onde * sprite_width/2;
				var _yy = y + random_range(-sprite_height/4,0);
		
				instance_create_depth(_xx,y,depth-1000,obj_vel);
		
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

//verificando x e y para quando eu reviver
x_player = 0;
y_player = 0;