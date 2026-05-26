/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

//--Colisão horizontal
//Aplicando o pause
if (global.pause) exit;
if (instance_exists(obj_dialogo)) or (instance_exists(obj_dialogo_escolha)) exit;

if (place_meeting(x + velh_anda, y ,obj_plat))
{
	while (!place_meeting(x+sign(velh_anda),y,obj_plat))
	{
		x += sign(velh_anda);	
	}
	velh_anda = 0;
}

//Aplicando o movimento horizontal

x += velh_anda;

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

//Invertendo o xscale
if (velh_anda != 0) image_xscale = sign(velh_anda);
