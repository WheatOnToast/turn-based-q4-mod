depth = -99999;

//---------textbox parameters----------------//
textbox_width = 192;
textbox_height = 48;
//prevents textbox from overlaying main char

i = 0;
textsnd = snd_narrator;
textbox_x = 32;
textbox_y = 128;
border = 8;

line_sep = 12;
line_width = textbox_width - border*2;
txtb_spr = spr_text_box;
txtb_img = 0;
txtb_img_spd = 0;

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

setup = false;
