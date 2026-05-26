/// @description Meio-termo a todo tempo
//Aplicando o pause
if (global.pause) exit;

//-----Chao
chao = place_meeting(x,y+1,obj_plat);//Checando se estou tocando no chao

if (chao) 
{
	carga = limite_carga;
	timer_pulo = limite_pulo
}
else
{
	if (timer_pulo > 0) timer_pulo--;	
}
//--Paredes
parede_dir = place_meeting(x+1,y,obj_plat);
parede_esq = place_meeting(x-1,y,obj_plat);

if (parede_dir or parede_esq)
{
	if (parede_dir) ultima_parede = 0;
	else ultima_parede = 1;
	timer_parede = limite_parede;
}
else
{
	if (timer_parede > 0) timer_parede--;	
}

//-----Controles
var _left,_right,_up,_down,_jump,_avanco_h,_dash,_jump_s

_left =		input_check("left") or input_gamepad_check(global.controle,"left");
_right =	input_check("right") or input_gamepad_check(global.controle,"right");
_up =		input_check("up") or input_gamepad_check(global.controle,"up");
_down =		input_check("down") or input_gamepad_check(global.controle,"down");
_jump =		input_check_pressed("jump") or input_gamepad_check_pressed(global.controle,"jump");
_jump_s =	input_check_released("jump") or input_gamepad_check_released(global.controle,"jump");
_dash =		input_check_pressed("dash") or input_gamepad_check_pressed(global.controle,"dash");


//Configurando informaçoes da movimentação

_avanco_h = (_right - _left) * max_velh;

if (chao) acel = acel_chao;
else acel = acel_ar;

//----------------State machine

//-----Movimentos
switch(estado)
{
	case state.parado:
	
	
	velh = 0;
	velv = 0;
	
	//gravidade
	if (!chao) velv += grav;
	
	//Posso mudar minha velocidade
	
	//Pulando
	if (_jump) and (chao) 
	{
		velv = -max_velv;	
		cria_poeira(false,100);
	}
	
	
	
	//Saindo do estado
	if (abs(velh) > 0) or (abs(velv) > 0) or (_left or _right or _jump) 
	{
		estado = state.movendo;
		image_ind = 0;	
	}
	
	
	//--Dash!
	if (_dash) and (carga > 0) and (duracao_total != 0)
	{
		estado = state.dash;
		//Definindo a direção
		if (!_right and !_left and !_up and !_down)
		{
			if (ver > 0) dir = 0	
			if (ver < 0) dir = 180
		}
		else dir = point_direction(0,0,(_right-_left),(_down-_up))
		carga--;
		
		image_ind = 0;
	}
	
	break;
	
	case state.movendo:
	
	//Gravidade e parede!
	
	if (!chao) and (parede_dir or parede_esq or timer_parede)
	{
		//Posso dar o wall jump, pois estou no ar e tocando na parede
		if (velv > 0)//Estou na parede e caindo
		{
			velv = lerp(velv,deslize,acel);	
			cria_poeira(true,random(100));
		}
		else//Estou na parede e subindo
		{
			velv += grav;
		}
		
		//Pulando pelas paredes
		if (!ultima_parede and _jump) //Parede direita e tentei pular
		{
			velv = -max_velv;
			velh = -max_velh;
			xscale = .5;
			yscale = 1.5;
			
			cria_poeira(true,100);
			
		}
		else if (ultima_parede and _jump) //Parede esquerda e tentei pular
		{
			velv = -max_velv;
			velh = max_velh;
			xscale = .5;
			yscale = 1.5;
			
			cria_poeira(true,100);
		}
		
	}
	else if (!chao) //Sem chao e parede
	{
		velv += grav;	
	}
	
	//Aplicando a velocidade
	
	velh = lerp(velh,_avanco_h,acel);
	
	//"poeira" de movimento
	if (abs(velh) > max_velh - .5 and chao)
	{
		
		cria_poeira(false,random(100));
			
	}
	
	//Pulando
	if (_jump) and (chao or timer_pulo) 
	{
		
		velv = -max_velv;
		
		cria_poeira(false,100);
		//Alterando a escala
		xscale = .5;
		yscale = 1.5;
	}
	
	//Buffer do pulo
	if (_jump) timer_queda = limite_buffer;
	
	if (timer_queda > 0) buffer_pulo = true;
	else buffer_pulo = false;
	
	if (buffer_pulo)
	{
		if (chao or timer_pulo)
		{
			velv = -max_velv;	
			cria_poeira(false,100);
			//Alterando a escala
			xscale = .5;
			yscale = 1.5;
			
			timer_pulo = 0;
			timer_queda = 0;
		}
		timer_queda--;
	}
	
	//Controlando a altura do pulo
	if (_jump_s and velv < 0) velv *= .7;
	
	//-----Saindo do estado
	
	if (chao) and (velv == 0) and (!_left) and (!_right) 
	{
		image_ind = 0;
		estado = state.parado;
	}
	
	//Dash!!!
	if (_dash) and (carga > 0) and (duracao_total != 0)
	{
		estado = state.dash;
		//Definindo a direção
		if (!_right and !_left and !_up and !_down)
		{
			if (ver > 0) dir = 0	
			if (ver < 0) dir = 180
		}
		else dir = point_direction(0,0,(_right-_left),(_down-_up))
		
		
		carga--;
		image_ind = 0;
	}
	
	//--Limitado as velocidades
	//velv = clamp(velv,-max_velv,max_velv);
	//Limitando a gravidade
	if (trampolim) velv = clamp(velv, -max_velv*boost, max_velv);
	else velv = clamp(velv, -max_velv, max_velv);
	
	break;
	
	
	case state.dash:
	dura_dash--;
	
	if (chao) carga--;
	
	//-----Aplicando o dash
	//Verificando se eu 
	
	if (chao) and (_jump)
	{
		dura_dash *= 1.25;
		velh = lengthdir_x(len*1.5,dir);
		velv = -max_velv/1.5;
		pulei_dash = true;
	}
	else
	{
		if (!pulei_dash)
		{
		velh = lengthdir_x(len,dir);
		velv = lengthdir_y(len,dir);
		}
	}
	
	//Aplicando gravidade caso eu pule
	if (pulei_dash) velv += grav;
	
	//Deformando o player
	if (dir == 90 or dir==270)
	{
		yscale = 1.5;
		xscale = .5;
	}
	else
	{
		xscale = 1.6;
		yscale = .5;	
	}
	
	
	
	//Criando o rastro
	var _rastro = instance_create_layer(x,y,layer,obj_player_vest);
	_rastro.xscale = xscale;
	_rastro.yscale = yscale;

	if (ver > 0) _rastro.xscale = xscale;
	else _rastro.xscale = -_rastro.xscale;
	
	
	//Saindo do estado
	
	if (dura_dash <= 0)
	{
		estado = state.movendo;
		dura_dash = room_speed/6;
		
		//Diminuindo a velocidade
		if (!pulei_dash)
		{
			velh = (max_velh * sign(velh) * .5);
			velv = (max_velv * sign(velv) * .5);
		}
		
		pulei_dash = false;
		image_ind = 0;
	}
	
	
	
	
	break;
	
	case state.morte:
	
		velh = 0;
		velv = 0;
		grav = 0;
		
		
		if (image_alpha >= 1) morte_explosao();
		
		image_alpha -= .05;
		
		var _tipo = choose(NUMEROTRANSICAO.CELESTEHORIZONTAL,NUMEROTRANSICAO.CELESTEVERTICAL,NUMEROTRANSICAO.ESCURECENDO);
		if (image_alpha == 0) transicao(room,_tipo,x_player,y_player,true,guarda_dash,guarda_dir);
		
		
		 
	
		break;
	
	case state.dialogo:
	
	velh = 0;
	velv = 0;
	
	if (instance_exists(npc))
	{
		if (npc.x < x) ver = -1;
		if (npc.x > x) ver  = 1;
	}
	
	//Qual objeto dialogo criar?
	if (instance_exists(npc))
	{
		if (npc.dialogo.escolha)
		{
			dialogo_criado = obj_dialogo_escolha;
		}
		else dialogo_criado = obj_dialogo;
	}
	
	//instanciando meu objeto dialogo
	if (!instance_exists(dialogo_criado))
	{
		var _obj_dialogo = instance_create_layer(x,y,layer,dialogo_criado);	
		_obj_dialogo.player = id;
		//Passando o dialogo do npc para o obj dialogo
		with(npc)
		{
			//Dialogo do obj dialogo
			_obj_dialogo.dialogo = dialogo//Dialogo do npc :)	
		}
	}
	
	break;
}

//--Dando o dash inicial
if (dash_inicial)
{
	guarda_dash = dash_inicial;
	guarda_dir = dir_inicial;
	
	estado = state.dash;
	dir = dir_inicial;
	
	dash_inicial = false;
	
}


//--Limitado
xscale = lerp(xscale,1,.15);
yscale = lerp(yscale,1,.15);

