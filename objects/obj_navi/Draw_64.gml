

if (global.toreplay)
{
var _efeito = (obj_replay.limite_replay / global.limite_global);

//Aplicando efeitos muito bacanas
var _blur = fx_create("_filter_greyscale");
fx_set_parameter(_blur,"g_Intensity",_efeito);

if (!layer_exists("efeito_replay"))
{
	//Criei minha layer e aplico o efeito
	layer_create(-1,"efeito_replay");
}

layer_set_fx("efeito_replay",_blur);

}
else 
{
	if (layer_exists("efeito_replay")) layer_destroy("efeito_replay")
}




