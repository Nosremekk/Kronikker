/// @description Insert description here
// You can write your code in this editor

//Verificando o tipo de transição de indo pro destino

switch(tipo)
{
	case 0:
	
	if (entrando)
	{
		//Animando a sprite
		img += img_vel;

		//Chegando as colunas
		if (img - img_num > linhas + 1)
		{
			if (room_exists(destino)) room_goto(destino);
			entrando = false;
		}
	}
	//Cabou a animação
	else
	{
		//Saindo da animação
		img -= img_vel;
		//perdendo o setembro amarelo apos acabar a animação
		if (img < -1)
		{
			instance_destroy();
			global.pause = false;
		}
	}
	
	break;
	
	case 1:
	if (entrando)
	{
		//Animando a sprite
		img += img_vel;

		//Chegando as colunas
		if (img - img_num > cols + 1)
		{
			if (room_exists(destino)) room_goto(destino);
			entrando = false;
		}
	}
	//Cabou a animação
	else
	{
		//Saindo da animação
		img -= img_vel;
		//perdendo o setembro amarelo apos acabar a animação
		if (img < -1) 
		{
			instance_destroy();
			global.pause = false;
		}
	}
	
	break;
	
	case 2:
	
	if (alpha >= 1) and (!inicio) //Ja completei tudo
	{
		inicio =  true;
		if (room_exists(destino)) room_goto(destino);
	}
	
	if (alpha <= .15) and (inicio) 
	{
		instance_destroy();
		global.pause = false;
	}
	
	break;
}


