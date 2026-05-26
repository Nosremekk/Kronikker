//Pause
if (global.pause) exit;

//Estou em movimento?
if (velh != 0) or (velv != 0)
{
//Volta no tempo

	if (instance_exists(obj_replay))
	{

		if (global.toreplay)
		{
			if (array_length(plataforma) > 0)
			{
				var _estado = array_pop(plataforma);
				x = _estado.x;
				y = _estado.y;
				velh = _estado.velh;
				velv = _estado.velv;
				parar = _estado.parar;
			}
		}
		else
		{
			array_push(plataforma, new plataforma_volta(x,y,velh,velv,parar));
			
			if (array_length(plataforma) > global.limite_global)
			{
				array_shift(plataforma);
			}
		}
	}

}

if (global.toreplay) exit;

switch(naovolta)
{
	case false:
	//Colisao
	if (alavanca) exit;


	var _col = place_meeting(x+velh,y,obj_player) or (place_meeting(x,y-1,obj_player));
	var _col_inverso = place_meeting(x-velh,y,obj_player)

	if (_col)
	{
		with (obj_player)
		{
			if (!place_meeting(x+other.velh,y,obj_plat))
			{
				x += other.velh;
			}
		}
	}
	
	if (_col_inverso)
	{
		with(obj_player)
		{
			if (!place_meeting(x-other.velh,y,obj_plat))
			{
				x += other.velh;
			}	
		}
	}
	

	x += velh;

	var _colisao = place_meeting(x, y + velv, obj_player) or place_meeting(x, y -1, obj_player) ;
	if (_colisao)
	{
		with(obj_player)
		{
			if (other.velv > 0) y += other.velv;
			if (!place_meeting(x, y + other.velv, obj_plat))
			{
				 y += other.velv
				 if (other.velv > 0) y -=grav;
			}
		}
	}

	y += velv;
	break;
	
	case true:
	
	if (!instance_exists(obj_player)) or (alavanca) exit;
	
	var _ativar = place_meeting(x, y- 12, obj_player) 
	
	if (_ativar) and (!parar) and (obj_player.velv == 0) 
	{
		var _col = place_meeting(x+velh,y,obj_player) or (place_meeting(x,y-1,obj_player));

		if (_col)
		{
			with (obj_player)
			{
				if (!place_meeting(x+other.velh,y,obj_plat))
				{
					x += other.velh;
				}
			}
		}

		x += velh;

		var _colisao = place_meeting(x, y + velv, obj_player) or place_meeting(x, y -1, obj_player) ;
		if (_colisao)
		{
			with(obj_player)
			{
				if (other.velv > 0) y += other.velv;
				if (!place_meeting(x, y + other.velv, obj_plat))
				{
					 y += other.velv
					 if (other.velv > 0) y -=grav;
				}
			}
		}

		y += velv;
		}
	else if (_ativar) and (parar)
	{
		x += 0;
		y += 0;
	}
	else if (!_ativar) and (x != xstart or y != ystart)
	{
		y -= velv;
		x -= velh;
		parar = false;
		
		//Garantindo que o player seja empurrado caso esteja na minha lateral ou em baixo
		var _player = place_meeting(x-velh,y-velv,obj_player);
		var _player_inverso = place_meeting(x+(velh*2),y,obj_player)
		
		if (_player) 
		{
			with(obj_player)
			{
				x -= other.velh;	
				y -= other.velv;
			}
		}
		
		if (_player_inverso)
		{
			with(obj_player)
			{
				//show_message("oi")
				x -= other.velh;	
			}
		}
	}
	
	
	
	
	break;
}

if (global.limpeza) plataforma = [];