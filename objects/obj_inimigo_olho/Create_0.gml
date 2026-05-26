/// @description Insert description here
// You can write your code in this editor



// Inherit the parent event
event_inherited();
grav = 0;
vida = 1;
estado = "parado";

//Gerenciando estado
campo_visao = 150;
destino_x = 0;
destino_y = 0;
tempo_estado = room_speed*10;
tempo = tempo_estado;
max_vel = 3;

//olhando player
olhando = function()
{
    var _player = collision_circle(x,y,campo_visao,obj_player,false,true);
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
            tempo--;
            velh = 0;
            velv = 0;

            //Condiçoes para sair do estado
            if (tempo <= 0)
            {
                //Mudando estado
                estado = choose("parado","andando");
                //reset de tempo
                tempo = tempo_estado;
            }
            olhando();

        break;
        #endregion 
        #region andando

        case "andando":
        tempo -= 10;
        var _dist = point_direction(x,y,destino_x,destino_y);
        if (destino_x == 0) or (destino_y == 0) or (_dist < max_vel*2)
        {
        destino_x = random_range(0,room_width)
        destino_y = random_range(0,room_height)
        }
        // pegando angulo
        var _dir = point_direction(x,y,destino_x,destino_y);

        // dizendo para onde devo ir e a velocidade que devo chegar
        velh = lengthdir_x(max_vel,_dir);
        velv = lengthdir_y(max_vel,_dir);

        //Voltando pro parado
        if (tempo <= 0)
        {
            tempo = tempo_estado;
            estado = choose("parado","parado","andando")
            destino_x = 0;
            destino_y = 0;
        }

        olhando()//perseguindo o pestista

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
                estado = choose("parado","parado","parado","andando")
                destino_x = 0;
                destino_y = 0;
                tempo = tempo_estado;
            }

            var _dir = point_direction(x,y,destino_x,destino_y)
            // dizendo para onde devo ir e a velocidade que devo chegar
            velh = lengthdir_x(max_vel,_dir);
            velv = lengthdir_y(max_vel,_dir);
            //saindo dessa porra
            var _dist =  point_distance(x,y,destino_x,destino_y)
            if (_dist > campo_visao + 30) 
            {
                alvo = noone;
            }
            //posso meter-lhe a porrada?
            if (_dist < 30)
            {
                estado = "ataque";
                tempo = tempo_estado;
            }

        break;
        #endregion

        #region ataque

        case "ataque":


            //Ficando mais rapido
            var _dir = point_direction(x,y,destino_x,destino_y);
            velh = lengthdir_x(max_vel*2.5,_dir)
            velv = lengthdir_y(max_vel*2.5,_dir)
            //Cheguei? pode sair do estado!
            var _dist = point_distance(x,y,destino_x,destino_y);
            if (_dist < 16)
            {
                velh = 0;
                velv = 0;
                espera_ataque--;
                if (espera_ataque <= 0)
                {
                    estado = "parado";
                    espera_ataque = room_speed*2;
                }
            }


        break;

        #endregion	
	}
}