distancia = 16;
angulo = 0;


corrente = []; 




for (var _i = 0; _i < tamanho; _i++;)
{
	var _obj = _i == tamanho-1? obj_bola : obj_corrente;
	var _dist_x = cos(angulo * (pi/180)) * (distancia * _i)
	var _dist_y = sin(angulo * (pi/180)) * (distancia * _i)
	filhos[_i] = instance_create_layer(x + _dist_x,y - _dist_y,layer,_obj)
	
}

