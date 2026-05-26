/// @description Insert description here
// You can write your code in this editor
if (global.pause) or (global.toreplay) exit;

_entra =	global.input[global.tipo_controle][CONTROLE.UP];

if (_entra) porta = false;


if (!porta)
{
switch(tipo)
{
	case "fade-in":
	onde = NUMEROTRANSICAO.ESCURECENDO;
	break;
	case "celeste_horizontal":
	onde = NUMEROTRANSICAO.CELESTEHORIZONTAL;
	case "celeste_vertical":
	onde  = NUMEROTRANSICAO.CELESTEVERTICAL;
	break;
	default:
	onde = NUMEROTRANSICAO.CELESTEHORIZONTAL;	
	break;
	

}


if (x_player == 0) x_player = other.x;

transicao(destino,trans,x_player,y_player,true,dash_inicial,dir_inicial);


instance_destroy();
}
