/// @description Transportando o player para onde ele deve estar
var _player = obj_player;
global.pause = true;

if (mexe_posicao) and (instance_exists(obj_player))
{
	//Colocando o player no lugar certo
	if (x_player != 0) _player.x = x_player;
	if (y_player != 0) _player.y = y_player;
	
	if (x_player > room_width/2) _player.ver = -1;
	else _player.ver = 1;
	//Axiomatizando a posição do player
	_player.x_player = x_player;
	_player.y_player = y_player;
	_player.dash_inicial = dash_inicial;
	_player.dir_inicial = dir_inicial;
	
	//Arrumando a navi
	if (instance_exists(obj_navi))
	{
		obj_navi.x = _player.x;	
		obj_navi.y = _player.y-32;
	}
	
	//Arrumando a camera
	if (instance_exists(obj_camera))
	{
		obj_camera.x = _player.x;
		obj_camera.y = _player.y;
	}
}

