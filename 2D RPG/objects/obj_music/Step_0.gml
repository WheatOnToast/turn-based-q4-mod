if(instance_exists(obj_player)){
	if(!(audio_is_playing(snd_play)) && obj_player.move_status != move_state.STOP){
		audio_stop_all();
		audio_play_sound(snd_play,2,true);
	}
}
else if(!audio_is_playing(snd_play) && play_once == 0){
	audio_stop_all();
	audio_play_sound(snd_play,2,false);
	play_once = 1;
}
