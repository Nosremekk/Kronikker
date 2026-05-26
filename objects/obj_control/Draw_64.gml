/// @description debug

if (instance_exists(obj_player))
{
	if (global.debug)
	{	
		draw_text(20,20, "vel horizontal: " + string(obj_player.velh));		
		draw_text(20,40, "vel vertical: " + string(obj_player.velv));
		draw_text(20,60, "dash: " + string(obj_player.carga));
	}
}

if (instance_exists(obj_player_daniel)) and (instance_exists(obj_replay))
{
	if (global.debug)
	{	
		var _cronometro = round(global.cronometro/room_speed);
		
		draw_text(20,20, "vel horizontal: " + string(obj_player.velh));		
		draw_text(20,40, "vel vertical: " + string(obj_player.velv));
		draw_text(20,60, "dash: " + string(obj_player.carga));
		draw_text(20,80, "limite replay: " + string(obj_replay.limite_replay));
		//draw_text(20,100, "index: " + string(global.index_desfazendo));
		draw_text(20,120, "mortes: " + string(global.mortes));
		draw_text(20,140, "cronometro: " + string(_cronometro));
		draw_text(20,160, "Cristais: " + string(global.cristal));
	}
}



if (global.pause) and (!instance_exists(obj_transicao))
{

//Aplicando efeitos muito bacanas
var _blur = fx_create("_filter_linear_blur");

if (!layer_exists("efeito_pause"))
{
	//Criei minha layer e aplico o efeito
	layer_create(-1000,"efeito_pause");
	layer_set_fx("efeito_pause",_blur);	
}

}
else 
{
	if (layer_exists("efeito_pause")) layer_destroy("efeito_pause")
}



//Desenhando titulo
if (alpha > 0) and (!instance_exists(obj_menu)) desenha_titulo(titulo_room);