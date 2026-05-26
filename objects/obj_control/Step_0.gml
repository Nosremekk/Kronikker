/// @description A todo momento
//Gamepad
var _slots = gamepad_get_device_count();
for (var _i = 0; _i < _slots; _i ++)
{
	if (gamepad_is_connected(_i))
	{
		global.controle = _i;	
	}
}

if (global.controle > 0) gamepad_set_axis_deadzone(global.controle,.25);

//Sistema de pause
var _pause = global.input[global.tipo_controle][CONTROLE.PAUSE];
if (_pause) and (!instance_exists(obj_transicao))
{
	if (room != rm_menu) global.pause = !global.pause;	
}

//Cronometro
if (!global.pause)
{
	global.cronometro++;	
}




