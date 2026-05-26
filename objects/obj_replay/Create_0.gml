/// @description Voltando no  tempo

//replay_vel = 1;

limite_replay = global.limite_global;
//Estou voltando no tempo?
voltando = false;
recuperando = false;


if (instance_exists(obj_player_daniel))
{
	player = obj_player_daniel;
}

// Inicia o histórico como uma array vazia
desfazendo = [];
//Estou em estado de replay
global.toreplay = false

//Arrumando bugs visuais
diferenca = 0;

