/// @description mato ou morro?
if (global.pause) exit;
if (global.toreplay) and (grav == 0) exit; //O inimigo que persegue nao me da dano em replay.



if (other.cancela_ataque) and (!pode_tomar)
{
	carga_player = other.carga;
	vida--;
	pode_tomar = true;
}

if (other.cancela_ataque == false) and (!pode_tomar) other.estado = state.morte;

//Garantindo que o player nao vai ficar preso em mim
if (pode_tomar)
{
	if (grav != 0) velv = -1;
	with(other)
	{
		if (other.carga_player == carga) carga++; //Dando um dash pro player
		
		//Aumento o tempo do dash pro player nao ficar preso em mim
		
		if (other.grav == 0) dura_dash++;
		else
		{
			//Inimigo comum
			if (dir > 180 and dir < 360) //To atacando ele por cima
			{
				dir = 90;
				dura_dash = 5;
			}
			else dura_dash++; //Se estou atacando pelos lados aumento meu dash
		}
		
	}
}


scr_treme();







