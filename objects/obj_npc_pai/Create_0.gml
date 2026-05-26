/// @description Iniciando variaveis

avancando = true;
//Criando a base do meu dialogo

dialogo =
{
	texto : ["Se acalme um pouco. Apesar dos perigos voce vai superar a Floresta!","O Cristal deve estar proximo, consegue sentir tambem?"],
	retrato : [spr_tampa_dialogo,spr_tampa_dialogo],
	txt_vel : .3,
	fonte : fnt_dialogo,
	som : [snd_dialogo,snd_dialogo],
	escolha : false,
	opcoes : [
        ["Opção 1", "Opção 2"],
        ["Opção A", "Opção B", "Opção C"],
        [] // Nenhuma opção para a página 3
    ] 
}


area = 45;
margem = sprite_width;

debug_area = function()
{
	var _x2 = x + ((area/2+margem) * image_xscale);
	var _y1 = y-4;
	var _x1 = x + (margem*image_xscale)
	
	draw_rectangle(_x1,_y1,_x2,y,true);
}

//Area do dialogo
dialogo_area = function()
{
	var _x1 = x + (margem*image_xscale)
	var _x2 = x + ((area/2+margem) * image_xscale);
	var _y1 = y-4;
	var _player = collision_rectangle(_x1,_y1,_x2+margem,y,obj_player,false,true);
	
	//Se o player esta colidindo na area
	if (_player)
	{
		var _up = global.input[global.tipo_controle][CONTROLE.UP];
		if (_up) _player.npc = self;
		
		//Vai para o estado de dialogo
		with(_player)
		{	
			if (_up) estado = state.dialogo
		}
	}
}

//Movimentação do npc


checar_parede = function()
{
	//--Paredes
	var _parede_dir = place_meeting(x+1,y,obj_plat);
	var _parede_esq = place_meeting(x-1,y,obj_plat);
	
	//Invertendo a velh
	if (_parede_dir or _parede_esq) velh_anda *= -1;
}

limite_anda = function()
{
	if (avancando)
	{
		var _limx = lengthdir_x(lim,dir);
		
		velh_anda = lengthdir_x(velocidade,dir);
	
		//Trocando de estado
		if (_limx > 0) //Tenho que ir para direita
		{
			if (x >= xstart + _limx) avancando = false;	
		}
		else if (_limx < 0) //Tenho que ir para a esquerda
		{
			if (x <= xstart + _limx) avancando = false;
		}
		
		if (keyboard_check_pressed(vk_escape)) 
		{
			show_message(velh_anda)
		}
		
	}
	else // voltando
	{
		if (x == xstart) avancando = true;
		
		velh_anda = -lengthdir_x(velocidade,dir);
		if (keyboard_check_pressed(vk_escape)) show_message(velh_anda)
	}
}

// Inherit the parent event
event_inherited();

