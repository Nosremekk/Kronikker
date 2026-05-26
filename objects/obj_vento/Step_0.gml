/// @description Aplicando o efeito no vento

var _player = instance_place(x,y,obj_player);


if (_player) 
{
	seno += .05;
	
	if (!_player.chao) _player.velv -= (_player.grav/3) + sin(seno)/2
	
}



