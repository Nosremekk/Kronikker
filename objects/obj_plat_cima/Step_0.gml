/// @description Insert description here
// You can write your code in this editor



if (instance_exists(obj_player))
{
	if (obj_player.y > y+1) //O player esta em baixo de mim
		sprite_index = -1;
	else
	{
		sprite_index = spr_plat_cima;
	}
		

	var _diferenca = (y - obj_player.y) //se der negativo entre 6 e 9 o player tem que subir um pouco
	
	if (instance_exists(obj_replay))
	{
		if (global.toreplay) and (_diferenca < -5 and _diferenca > -10)
		{
			//show_message("oi");
			obj_replay.diferenca = _diferenca;
		}
		else obj_replay.diferenca = 0;
	}
	
}




