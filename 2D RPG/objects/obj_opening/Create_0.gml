fade = 0;
fade_out = 1;
fade_event_happen = 0;
fade_out_event_happen = 0;
obj_book.image_alpha = 0;
audio_play_sound(snd_opening_2,1,false);
with(instance_create_depth(0, 0, -9999, obj_opening_textbox))
{
	scr_game_text("opening_1");
}
alarm[0] = 300; //book fade in
alarm[1] = 785; //book rotation
alarm[2] = 980; //text
alarm[3] = 1800; //text


alarm[8] = 2900;//evil transition

alarm[4] = 3000;//text
alarm[5] = 4000;//text

alarm[9] = 4700;//light transition

alarm[6] = 4800;//text

alarm[7] = 5500;//text
alarm[11] = 6000;//book fade out

alarm[10] = 6800;//text


