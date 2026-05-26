//Posso destruir dos dois lados
if (!dir and !esq)
{
dir = true;
esq = true;
}


var _col_dir = instance_place(x + sprite_width/2,y,obj_player)
var _col_esq = instance_place(x - sprite_width/2,y,obj_player)

if (_col_dir) or (_col_esq)
{
	if (obj_player.estado == state.dash) 
	{
		if (dir) and (obj_player.x > x) global.plat_destroi[index] = true;

		if (esq) and (obj_player.x < x) global.plat_destroi[index] = true;
	}	
}

if (global.plat_destroi[index] == true) instance_destroy();