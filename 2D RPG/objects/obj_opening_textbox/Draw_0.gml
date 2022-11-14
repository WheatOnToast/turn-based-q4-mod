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
	if(textsnd != 0){ audio_play_sound(textsnd,1,false); }
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
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
				instance_destroy();
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
txtb_spr_w = sprite_get_width(txtb_spr);
txtb_spr_h = sprite_get_height(txtb_spr);

//back of textbox
draw_sprite_ext(txtb_spr, txtb_img, textbox_x, textbox_y, textbox_width/txtb_spr_w, textbox_height/txtb_spr_h, 0, c_white, 1);

//draw the text
var _drawtext = string_copy(text[page], 1, draw_char);
draw_text_ext(textbox_x + border, textbox_y + border, _drawtext, line_sep, line_width);




