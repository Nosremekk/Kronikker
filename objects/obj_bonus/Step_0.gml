/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_replay))
{

	if (global.toreplay)
		{
			if (array_length(power_up) > 0)
			{
				var _estado = array_pop(power_up);
				sumir = _estado.sumir;
				pode_sumir = _estado.pode_sumir;
				pode_aparecer = _estado.pode_aparecer;
				image_alpha = _estado.image_alpha;
				loop = _estado.loop;
			}
		}
		else
		{
			array_push(power_up, new power_up_volta(sumir,pode_sumir,pode_aparecer,image_alpha,loop));
			
			if (array_length(power_up) > global.limite_global)
			{
				array_shift(power_up);
			}
		}
}

image_xscale = sin(loop)

//Deixando invisivel por causa do efeito preto/branco
if (global.toreplay) and (sumir) sprite_index = -1;
else sprite_index = spr_bonus
//Aplicando o pause
if (global.pause) or (global.toreplay) exit;



//if (desbloqueio) exit;

if (sumir)
{
	image_alpha+= alfa;
	
	if (image_alpha >= .75)
	{
		image_alpha = 1;
		sumir = false;
	}
}

loop += .1;
