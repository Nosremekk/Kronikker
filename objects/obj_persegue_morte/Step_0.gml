/// @description Insert description here
// You can write your code in this editor
if (global.toreplay) 	
{
	if (tipo == "horizontal" and image_xscale != 1) image_xscale += (-vel_expansao/50);
	else if (tipo == "vertical" and image_yscale != 1) image_yscale -= (-vel_expansao/50);
}
if (global.pause) or (global.toreplay) exit;


switch(tipo)
{
	case "horizontal":
	
	image_xscale += (vel_expansao/50);
	image_yscale = tamanho_y;
	
	break;
	
	case "vertical":
	
	image_yscale -= (vel_expansao/50);
	image_xscale = tamanho_x;
	
	break;
}




