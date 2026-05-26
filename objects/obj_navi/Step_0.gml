//Pause
if (global.pause) exit;

//Volta no tempo
if (instance_exists(obj_replay))
{
	if (global.toreplay)
	{
		
		if (array_length(historico) > 0)
		{
			var _estado = array_pop(historico);
			
			pai  = _estado.pai;
			lado = _estado.lado;
			x	 = _estado.x;
			y    = _estado.y;
		}
	}
	else
	{
		
		array_push(historico, new navi_volta(pai, lado, x, y));
		
		
		if (array_length(historico) > global.limite_global)
		{
			array_shift(historico);
		}
	}
}


if (global.toreplay) exit;


//X e Y
x = lerp(x, pai.x - lado, .05);
y = lerp(y, pai.y - 32, .05);

//Arrumando o lado
if (pai.ver == 1) lado = 32;
else lado = -32;