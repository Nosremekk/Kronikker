if (global.musica != musica_atual)
{
    audio_stop_sound(musica_atual);
    musica_atual = global.musica;
    audio_play_sound(musica_atual,0,true);
	audio_sound_gain(musica_atual,global.volume,0);
    audio_sound_pitch(global.musica,.5);
}