//--Colisão horizontal
//Aplicando o pause
if (global.pause) exit;
if (global.toreplay) exit;

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






