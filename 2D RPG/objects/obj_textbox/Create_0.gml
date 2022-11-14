depth = -99999;

//---------textbox parameters----------------//
textbox_width = 160;
textbox_height = 48;

//prevents textbox from overlaying main char
if(obj_player.y > 80){
	y_pos = 8;
}
else{
	y_pos = 88;	
}

y_pos = 8;

i = 0;
textbox_x = camera_get_view_x(view_camera[0]) + 45;
textbox_y = camera_get_view_y(view_camera[0]) + 135;
border = 8;

line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_menu;
txtb_img = 0;
txtb_img_spd = 0;

text_snd = snd_narrator;
text_snd_flag = 0;
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

xscale = textbox_width/txtb_spr_w;
yscale = textbox_height/txtb_spr_h;

//----------------------text----------------------//
attack_string = ""; //hold string of specified attack being used
skip = true;		//if text can be skipped
instance_time = 160; //how long each page should be up and how long txtbox lasts after complete
page_number = 0;
page = 0;
text[0] = "";
text_length[0] = string_length(text[0]);
draw_char = 0;
text_speed = 1;

//options
option[0] = "";
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;

setup = false;

obj_player.move_status = move_state.STOP;