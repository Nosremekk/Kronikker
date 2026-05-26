/// @description Aplicando iluminação

//Checando se a surface existe
if (!surface_exists(surf))
{
	//criando a surface
	surf = surface_create(room_width,room_height);
}
else
{//Com minha surface criada, posso aplicar a iluminação
	
	surface_set_target(surf);
	draw_clear_alpha(c_black,ambiente);
	
	gpu_set_blendmode(bm_subtract);
	
	/*
	if (instance_exists(obj_player))
	{
		
		with(obj_player)
		{
			var _muda = sin(other.numero)/2.5
			draw_sprite_ext(spr_luz,0,x,y,1.5+_muda,1.5+_muda,0,c_white,other.player_ambiente);	
		
			other.numero += .01;
		}
	
	}
	*/
	
	if (instance_exists(obj_navi))
	{
		with(obj_navi)
		{
			var _muda = sin(other.numero)/2.5
			draw_sprite_ext(spr_luz,0,x,y,2.5+_muda,2.5+_muda,0,c_white,other.navi_ambiente);
			other.numero += .01;
		}
	}
	
	if (instance_exists(obj_tempo_powerup))
	{	
		with(obj_tempo_powerup)
		{
			var _muda = sin(other.numero)/2.5
			draw_sprite_ext(spr_luz,0,x,y,3+_muda,3+_muda,0,c_white,1);
			other.numero += .01;
		}
	}
	
	
	
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface(surf,0,0);
	
	
}






