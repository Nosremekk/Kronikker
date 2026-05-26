/// @description desenhando


switch(tipo)
{
	//-----A de Numero Zero
	case 0:
	//Desenhando meus quadrados
	for (var _i = 0; _i < linhas; _i++)
	{
		for (var _j = 0; _j < cols; _j++)	
		{
			//Celula
		
			//garantindo o limite da animação!
			var _img = min(max(0, img-_i), img_num);
		
			draw_sprite_ext(spr_quadrado_transicao,_img,_j*tamanho,_i*tamanho,1,1,0,c_black,1);
		}
	}
	
	
	break;
	//----Primeira
	case 1:
	//Desenhando meus quadrados
	for (var _i = 0; _i < linhas; _i++)
	{
		for (var _j = 0; _j < cols; _j++)	
		{
			//Celula
		
			//garantindo o limite da animação!
			var _img = min(max(0, img-_j), img_num);
		
			draw_sprite_ext(spr_quadrado_transicao,_img,_j*tamanho,_i*tamanho,1,1,0,c_black,1);
		}
	}
	break;
	
	//Segunda Transição
	case 2:
	
	if (!inicio) alpha += .05;
	else alpha -= .05;
	
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	
	var _tamanho_cam_x  = view_get_wport(0);
	var _tamanho_cam_y  = view_get_hport(0);
	
	draw_rectangle(0,0,_tamanho_cam_x,_tamanho_cam_y,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	
	break;
}







