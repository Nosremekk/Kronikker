//Volta no tempo
if (instance_exists(obj_replay))
{

	if (global.toreplay)
		{
			if (array_length(plataforma_cai) > 0)
			{
				var _estado = array_pop(plataforma_cai);
				timer_queda = _estado.timer_queda;
				col_player = _estado.col_player;
				timer_volta = _estado.timer_volta;
				voltando = _estado.voltando;
				image_alpha = _estado.image_alpha;
				sprite_index = _estado.sprite_index;
			}
		}
		else
		{
			array_push(plataforma_cai, new plataforma_cai_volta(timer_queda,col_player,timer_volta,voltando,image_alpha,sprite_index));
			
			if (array_length(plataforma_cai) > global.limite_global)
			{
				array_shift(plataforma_cai);
			}
		}
}


if (global.pause or global.toreplay) exit;





var _col = place_meeting(x,y-1,obj_player); //O player esta acima de mim

if (_col) col_player = true//O player colidiu comigo

if (col_player)
{
	timer_queda--;	
}


if (timer_queda <= 0) //Tenho que "cair"
{
	voltando = true;
	sprite_index = -1;
	image_alpha = 0;
}

if (voltando) timer_volta--;

if (timer_volta <= 0)
{
	sprite_index = spr_plat;
	image_alpha = 1;
	voltando = false;
	col_player = false;
	timer_queda = room_speed;
	timer_volta = room_speed*3;
}

//Se o player esta abaixo de mim ele pode subir
if (cima)
{
	if (instance_exists(obj_player))
	{
		if (obj_player.y > y+1) sprite_index = -1; //O player esta em baixo de mim
		else if (obj_player.y <= y+1) and (!col_player) sprite_index = spr_plat
	}
}

//Modificando a sprite(place holder)
if (cima) sprite = spr_plat_cai_sobe;
else sprite = spr_plat_cai;