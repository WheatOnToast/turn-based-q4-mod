//fade in book
if(fade_event_happen == 1){
	fade += 0.05;
	obj_book.image_alpha = fade;
}

if(fade_out_event_happen == 1){
	fade_out -= 0.005;
	obj_book_no_orb.image_alpha = fade_out;
}

if(keyboard_check_pressed(ord("X"))){
	audio_stop_all();
	room_goto(rm_title_screen);
}

