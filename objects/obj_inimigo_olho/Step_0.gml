  /// @description  A todo momento

//Aplicando o pause
if (global.pause) exit;
//Aplicando a volta no tempo
if (instance_exists(obj_replay))
{

	if (global.toreplay)
		{
			if (array_length(inimigo) > 0)
			{
				var _estado = array_pop(inimigo);
				x = _estado.x;
				y = _estado.y;
				image_xscale = _estado.image_xscale;
				image_yscale = _estado.image_yscale;
				sprite_index = _estado.sprite_index;
				image_index = _estado.image_index;
				estado = _estado.estado;
			}
			else
			{
				instance_destroy();
			}
		}
		else
		{
			array_push(inimigo, new inimigo_volta(x,y,image_xscale,image_yscale,sprite_index,image_index,estado));
			
			if (array_length(inimigo) > global.limite_global)
			{
				array_shift(inimigo);
			}
		}
}

if (global.toreplay) exit;

//chao
var _chao = place_meeting(x,y+1,obj_plat);

//-----Inimigo
olhando()
controla_estado();


//--Perdendo um de vida por hit
var _player = place_meeting(x,y,obj_player);
if (pode_tomar) and (!_player) pode_tomar = false;


//gravidade
if (!_chao) velv += grav;


//Morrendo 
if (vida <= 0) 
{
	instance_destroy();
	morte_explosao();
}

if (global.limpeza) inimigo = [];