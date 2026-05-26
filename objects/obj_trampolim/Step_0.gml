/// @description Acontece a todo momento
if (global.pause) exit;
var _impulso = instance_place(x,y,obj_player);
var _jump	 = global.input[global.tipo_controle][CONTROLE.JUMP_IN];

//Volta no tempo
if (instance_exists(obj_replay))
{
	if (global.toreplay)
	{
		if (array_length(trampolim) > 0)
		{
			var _estado = array_pop(trampolim);
			sprite_index = _estado.sprite_index;		
			image_index = _estado.image_index;		
			check_anim = _estado.check_anim;		
			timer_tramp = _estado.timer_tramp;		
			botao_tramp = _estado.botao_tramp;		
			boost = _estado.boost;		
		}
	}
	else
	{
		array_push(trampolim, new trampolim_volta(sprite_index,image_index,check_anim,timer_tramp,botao_tramp,boost));
		
		if (array_length(trampolim) > global.limite_global)
		{
			array_shift(trampolim);
		}
	}
}

if (global.toreplay) exit;

if (_impulso)
{
	check_anim = true;
	_impulso.trampolim = true;
	_impulso.carga = global.limite_dash;
	
	scr_treme();
	
	efeitos_sonoros(snd_jump);
	
	
	if (_jump) 
	{
		boost = 1.45
		_impulso.boost = boost;
	}
	else 
	{
		boost = 1.25;
		_impulso.boost = boost;
	}
	_impulso.velv = (-_impulso.max_velv) * boost;	
	
	if (_impulso.estado == state.dash)
	{
		_impulso.estado = state.movendo;
		_impulso.dura_dash = room_speed/6;
		_impulso.pulei_dash = false;
		_impulso.image_ind = 0;
	}
		
}



if (check_anim) or (botao_tramp)
{
	if (!botao_tramp)
	{
		image_index = 0;
		sprite_index = spr_trampolim_move;
		botao_tramp = true;
		check_anim = false;
	}
	
	if (image_index >= 7)
	{
		image_index = 0;
		sprite_index = spr_trampolim_idle;
		botao_tramp = false;
		check_anim = false;
	}
	
}