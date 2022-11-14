audio_stop_all();
obj_btl_music.snd_play = snd_battle_won;
with(instance_create_depth(0, 0, -9999, obj_textbox))
{
	textbox_x = 48;	
	textbox_y = 144;
	textbox_height = 32;
	instance_time = 180;
	xscale = 13;
	yscale = 3;		
	skip = false;
	scr_text("You Won!!");
}
win = 1;
