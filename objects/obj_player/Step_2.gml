/// @description Step final
//Aplicando o pause
if (global.pause) exit;

//-----Colisões 

//--Colisão horizontal
if (place_meeting(x + velh, y ,obj_plat))
{
	while (!place_meeting(x+sign(velh),y,obj_plat))
	{
		x += sign(velh);	
	}
	velh = 0;
}

//Aplicando o movimento horizontal

x += velh;
x = round(x);

//--Colisao vertical
if (place_meeting(x,y+velv,obj_plat))
{
	while (!place_meeting(x,y+sign(velv),obj_plat))
	{
		y += sign(velv);	
	}
	velv = 0;
}
//Aplicando o movimento vertical
y += velv;
y = round(y);




