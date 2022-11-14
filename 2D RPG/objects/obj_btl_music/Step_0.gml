if(!(audio_is_playing(snd_play))){
	audio_stop_all();
	audio_play_sound(snd_play,2,true);
}

