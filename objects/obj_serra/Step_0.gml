/// @description A todo momento



//Aplicando o pause e volta no tempo
if (global.pause) exit;

if (instance_exists(obj_replay))
{
	if (global.toreplay)
	{
		if (array_length(serra) > 0)
		{
			var _estado = array_pop(serra);
			x = _estado.x;
			image_angle = _estado.image_angle;
			y = _estado.y;
		}
		else
		{
			instance_destroy();
		}
	}
	else
	{
		array_push(serra, new serra_volta(x,y,image_angle));
		
		if (array_length(serra) > global.limite_global)
		{
			array_shift(serra);
		}
	}
}

if (lancado)
{
	if (!global.toreplay) timer_suicidio++;
	else timer_suicidio--;
}
//Parando tudo caso esteja voltando no tempo
if (global.toreplay) exit;

//Rodando
image_angle += rot;

//Caso lançado
if (lancado)
{
	x += velocidade_lancamentox;	
	y += velocidade_lancamentoy;
	

	if (timer_suicidio >= suicidio) 
	{
		//morte_explosao();
		instance_destroy();
	}
}

if (lancado) exit; //Ele não é uma state machine se foi lançado

//Estados
switch(estado)
{
	case "avanca":
	
		var _limx = lengthdir_x(lim,dir);
		var _limy = lengthdir_y(lim,dir);
		
		x += lengthdir_x(vel,dir);
		y += lengthdir_y(vel,dir);
		
		//Trocando de estado
		if (_limx > 0) //Tenho que ir para direita
		{
			if (x >= xstart + _limx) estado = "recua";	
		}
		else if (_limx < 0) //Tenho que ir para a esquerda
		{
			if (x <= xstart + _limx) estado = "recua";
		}
		
		if (_limy > 0) //Tenho que ir para baixo
		{
			if (y >= ystart + _limy) estado = "recua";	
		}
		else if (_limy < 0) //Tenho que ir para a cima
		{
			if (y <= ystart + _limy) estado = "recua";
		}
	
		break;
	
	case "recua":
		
		//Voltando
		x -= lengthdir_x(vel,dir);
		y -= lengthdir_y(vel,dir);
		//Voltando pro estado de avancar
		if (x == xstart and y == ystart) estado = "avanca";
	
	
		break;
	
	case "parado":
	
		break;
	
	default:
		
		show_message("Deu erro");

	break;
}