accept_key = keyboard_check_pressed(ord("X"));



//-------------setup-------------------//
if(setup == false){
	setup = true;
	draw_set_font(global.font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	//loop thru pages
	page_number = array_length(text);
	for(var p = 0; p < page_number; p++){
		
		//keeps track of line length
		text_length[p] = string_length(text[p]);
		
		//get x position for textbox (center for textbox)
		text_x_offset[p] = 32;
	}
}

//---------------------typing text-------------------//
if(draw_char < text_length[page]){
	if(text_snd_flag == 0){
		audio_play_sound(text_snd,1,true);
		text_snd_flag = 1;
	}
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
}

if(draw_char == text_length[page]){
	audio_stop_sound(text_snd);	
	text_snd_flag = 0;
}
//---------------flip thru pages---------------//
if(skip == true)
{
	if(accept_key){
		//if typing is done
		if(draw_char == text_length[page]){
			//text page
			if(page < page_number-1){
				page++;
				draw_char = 0;
			}
			//destroy textbox
			else{
				//link text options
				if(option_number > 0){
					create_textbox(option_link_id[option_pos]);
					obj_player.move_status = move_state.STOP;
				}
				instance_destroy();
				if(option_number == 0){
					obj_player.move_status = move_state.GO;
				}
			}
		}
		//if not done typing
		else{
			draw_char = text_length[page];	
		}
	}
}

else if(skip == false)
{
    //if typing is done
	if(draw_char == text_length[page]){
		//text page
		if(page < page_number-1){
			if(alarm[1] <= -1) {alarm[1] = instance_time;}
		}
		//destroy textbox
		else{
			if(alarm[0] <= -1) {alarm[0] = instance_time;}
		}
	}
}

//--------------draw the textbox-------------//
txtb_img += txtb_img_spd;
var _txtb_x = textbox_x + text_x_offset[page];
var _txtb_y = textbox_y;
//back of textbox
draw_sprite_ext(txtb_spr, txtb_img, textbox_x, textbox_y, xscale, yscale, 0, c_white, 1);


//-----------------options--------------------//
if(draw_char == text_length[page] && page == page_number-1){	
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_number - 1);
	
	var _op_space = 15;
	var _op_bord = 4;
	for(var op = 0; op < option_number; op++){
		//option box
		var _op_width = string_width(option[op]) + _op_bord*2;
		draw_sprite_ext(txtb_spr, txtb_img, _txtb_x-32, _txtb_y - _op_space*option_number + _op_space*op, _op_width/txtb_spr_w, (_op_space-1)/txtb_spr_h, 0, c_white, 1);
		
		//arrow
		if(option_pos == op){
			draw_sprite(spr_arrow, 0, _op_width+64+camera_get_view_x(view_camera[0]), _txtb_y-_op_space*option_number+_op_space*op)	
		}
		//the option text
		draw_text(_txtb_x-32+_op_bord, _txtb_y-_op_space*option_number+_op_space*op+2, option[op]);
	
	}
}
//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);




