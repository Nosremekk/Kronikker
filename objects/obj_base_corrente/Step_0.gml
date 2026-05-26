if (global.pause) exit;

if (instance_exists(obj_replay))
{

	if (global.toreplay)
	{
		if (array_length(corrente) > 0)
		{
			var _estado = array_pop(corrente);
			angulo = _estado.angulo;
		}
	}
	else
	{
		array_push(corrente, new corrente_volta(angulo));
		
		if (array_length(corrente) > global.limite_global)
		{
			array_shift(corrente);
		}
	}

}

angulo += velocidade;


for (var _i = 0; _i < tamanho; _i++;)
{
	var _dist_x = cos(angulo * (pi/180)) * (distancia * _i)
	var _dist_y = sin(angulo * (pi/180)) * (distancia * _i)
	filhos[_i].x = x + _dist_x;
	filhos[_i].y = y - _dist_y;
	
}



if (global.limpeza) corrente = [];