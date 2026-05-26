/// @description aplicando o efeito mola

//Pausando o jogo
if (global.pause) exit;

var _impulso = instance_place(x + sign(image_xscale),y,obj_player);


if (_impulso)//Player encostou
{
	scr_treme();
	_impulso.mola = true;
	
	if (_impulso.estado == state.dash)
	{
		_impulso.estado = state.movendo;
		_impulso.dura_dash = room_speed/6;
		_impulso.pulei_dash = false;
		_impulso.image_ind = 0;	
		
		_impulso.velh = 40 * image_xscale;	
	}
	else _impulso.velh = 30 * image_xscale;	
	
	
	
	_impulso.carga = global.limite_dash;
	
	

}

if (instance_exists(obj_player))
{
	
	if (obj_player.mola) alarme--;

	if (alarme <= 0)
	{
		alarme = room_speed/4;
		obj_player.mola = false;
		obj_player.boost = 1;
	}

}
	
	




