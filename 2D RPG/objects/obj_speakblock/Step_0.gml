if(place_meeting(x, y, obj_player) && !instance_exists(obj_textbox)){
	if (keyboard_check_pressed(ord("X")) ){
		obj_player.move_status = move_state.STOP;
		create_textbox(text_id);
	}
}
