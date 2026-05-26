/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor



vida = 3;
pode_tomar = false;
carga_player = 0;
estado = "parado";
grav = 3;

inimigo = [];



// Inherit the parent event
event_inherited();
grav = 3;
//Maquina de estados
estado = "parado";
//Gerenciando estado
campo_visao = 450;
destino_x = 0;
destino_y = 0;
tempo_estado = room_speed*5;
tempo = tempo_estado;
max_vel = 3;
espera_ataque = room_speed*2;
ver = image_xscale;
debug_ataque = 60;
chao = place_meeting(x,y+1,obj_plat);//Checando se estou tocando no chao

//olhando player
olhando = function()
{
    var _player = collision_rectangle(x,y,x+(campo_visao*image_xscale),y-48,obj_player,false,true);
    if (_player) 
    {
        estado = "persegue";
        alvo = _player;
    }
	
}

controla_estado = function()
{	
switch(estado)
    {
        #region parado
        case "parado":

            //Ele deve ficar parado
            velh = 0;
            velv = 0;

            olhando();

        break;
        #endregion 


#region persegue

        case "persegue":

            if (alvo)
            {
                destino_x = alvo.x;
                destino_y = alvo.y;
            }
            else 
            {
                estado = "parado";
                destino_x = 0;
                destino_y = 0;
                tempo = tempo_estado;
            }

            var _dir = point_direction(x,y,destino_x,y)
            // dizendo para onde devo ir e a velocidade que devo chegar
            velh = lengthdir_x(max_vel,_dir);
            //saindo
            var _dist =  point_distance(x,y,destino_x,y)
            if (_dist > campo_visao + 30) 
            {
                alvo = noone;
            }
			
			if (alvo != noone)
			{
				if (image_xscale > 0 and alvo.x < x) or (image_xscale < 0 and alvo.x > x)
				{
					alvo = noone;	
				}
			}
			
            //posso meter-lhe a porrada?
            if (_dist < 180)
            {
                estado = "indo_ataque";
                tempo = tempo_estado;
            }

        break;
        #endregion
		
		case "indo_ataque":
		sprite_index = spr_lobo_teste_atk
		velh = 0;
		velv = 0;
		
		tempo -= 20;
		
		if (tempo <= 0)
		{
			estado = "ataque";
			tempo = tempo_estado;
		}
		
		break;

        #region ataque
		case "ataque":
		sprite_index = spr_lobo_teste;
		var _dir = point_direction(x,y,destino_x,y)
		velh = lengthdir_x(max_vel*3,_dir);
		debug_ataque--;
		
		
		//Cheguei? pode sair do estado!
        var _dist = point_distance(x,y,destino_x,y);
        if (_dist < 32) or (debug_ataque <= 0)
        {
		espera_ataque = room_speed*2;
		velh = 0;
	    velv = 0;
		debug_ataque = 60;
		estado = "espera_ataque" 
		}
		
		
		break;
		
		case "espera_ataque":
		
		velh = 0;
		velv = 0;
		espera_ataque--;
		
		if (espera_ataque <= 0) estado = "parado";
		
		break;
		

}
}