if (global.toreplay) and (instance_exists(obj_replay))
{
    pito = 1 + ( ((obj_replay.limite_replay/global.limite_global) * 8.5) - 2.75);
	pito = clamp(pito,1,10);
    audio_sound_pitch(musica_atual,pito)
}
else if ((!global.toreplay) and (instance_exists(obj_replay))) or (!instance_exists(obj_player_daniel))
{
    pito = 0;
    audio_sound_pitch(musica_atual,1);
}

//Pausando a musica
if (global.pause) and (!instance_exists(obj_transicao)) audio_pause_sound(musica_atual);
else audio_resume_sound(musica_atual)
//Mudando o volume
if (som_atual != global.volume)
{
	audio_sound_gain(musica_atual,global.volume/10,0);	
	som_atual = global.volume;
}