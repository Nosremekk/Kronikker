/// @description Primeiro step
//Aplicando o pause
if (global.pause)
{
	xscale = 1;
	yscale = 1;
}

if (global.pause) exit;

x = round(x);
y = round(y);

if (chao) and (trampolim) trampolim = false;

// checando se eu acabei cair no chao
var _temp = place_meeting(x,y+1,obj_plat);

if (_temp and !chao)
{ // acabei de tocar no chão
	xscale = 1.6;
	yscale = .5;
	
	//Criando a poeira
	cria_poeira(false,100);
	
}

//Clamp x e y
var _tira = sprite_width/2;
x = clamp(x,0,room_width-_tira);
//y = clamp(y,0,room_height);



