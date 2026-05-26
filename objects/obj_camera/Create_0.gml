/// @description Insert description here
// You can write your code in this editor
alvo = obj_player;
estado = noone;

cam_w = camera_get_view_width(view_camera[0]);
cam_h = camera_get_view_height(view_camera[0]);

escala_padrao = escala;

//Pra nao dar sensação estranha o x e y ja começam no alvo
if (alvo)
{
	x = alvo.x;	
	y = alvo.y;
}


zoom = function()
{
	//Definindo o tamanho da view
	camera_set_view_size(view_camera[0],cam_w * escala,cam_h * escala);
	
	//Alterando a escala
	if (mouse_wheel_down())
	{
		escala += .05;	
	}
	
	if (mouse_wheel_up())
	{
		escala -= .05;	
	}
	
	if (alvo.estado == state.dialogo) escala = lerp(escala,escala_padrao/1.75,.05)
	else escala = lerp(escala,escala_padrao,.05);
	
}


//Seguindo o player

segue_alvo = function()
{
	var _view_w = camera_get_view_width(view_camera[0])
	var _view_h = camera_get_view_height(view_camera[0])
	
	var _cam_x = x - _view_w/2
	var _cam_y = y - _view_h/2
	
	//Impedindo que saia da room e aplicando o lerp de seguir
	
	_cam_x = clamp(_cam_x,0,room_width - _view_w)
	_cam_y = clamp(_cam_y,64,room_height - _view_h)
	
	x = lerp(x,alvo.x,.1);
	y = lerp(y,alvo.y,.1);
	
	if (!instance_exists(obj_shake))
	{
	camera_set_view_pos(view_camera[0],_cam_x,_cam_y)
    }
}

segue_player = function()
{
	//Checando se o player existe
	if (instance_exists(obj_player)) alvo = obj_player;
	else estado = segue_nada;
	segue_alvo();
	
	/*
	//Siga o inimigo caso aperte espaço!
	if (keyboard_check_released(vk_space))
	{
		estado = segue_inimigo;	
	}
	*/
	
}



segue_nada = function()
{
	alvo = noone;	
}


segue_inimigo = function()
{
	alvo = obj_serra;
	segue_alvo()	
	
	//Siga o player caso aperte espaço!
	if (keyboard_check_released(vk_space))
	{
		estado = segue_player;	
	}
}


estado = segue_player;








