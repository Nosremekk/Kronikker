/// @description  Criando as serras
if (global.toreplay) alarme = 0;
if (global.toreplay) or (global.pause) exit; //Aplicando pause e essas coisas

alarme++;

if (alarme >= room_speed*tempo)
{
	var _serra = instance_create_layer(x,y,layer,obj_serra);
	_serra.rot = rot;
	_serra.lancado = true;
	_serra.suicidio = suicidio * room_speed;

	switch(dir)
	{
		case 0 : 
		_serra.velocidade_lancamentox =	vel_serra;
		break;
		case 90:
		_serra.velocidade_lancamentoy = -vel_serra;
		break;
		case 180:
		_serra.velocidade_lancamentox = -vel_serra;
		break;
		case 270:
		_serra.velocidade_lancamentoy = vel_serra;
		break;
	
	}
	alarme = 0; // resetando o alarme

}





