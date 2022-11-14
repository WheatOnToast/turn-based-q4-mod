right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

xspd = round((right_key - left_key) * move_spd); //right = 1 * move_spd, left = -1 * move_spd
yspd = round((down_key - up_key) * move_spd); 

//following mabel
x = obj_player.pos_x[0];
y = obj_player.pos_y[0];


mask_index = sprite[DOWN];
if instance_exists(obj_pauser)
{
	xspd = 0;
	yspd = 0;
}

if(move_status == move_state.GO)
{
	if yspd == 0
	{
		if xspd > 0 {face = RIGHT};
		if xspd < 0 {face = LEFT};
	}
	if xspd > 0 && face == LEFT {face = RIGHT};
	if xspd < 0 && face == RIGHT {face = LEFT};

	if xspd == 0
	{
		if yspd > 0 { face = DOWN};
		if yspd < 0 { face = UP};	
	}

	if yspd > 0 && face == UP {face = DOWN};
	if yspd < 0 && face == DOWN {face = UP};

	sprite_index = sprite[face];

	//collsions
	if place_meeting(x + xspd, y , obj_player) == true 
	{
		xspd = 0;	
	}
	if place_meeting(x , y + yspd, obj_player) == true
	{
		yspd = 0;	
	}

	//animate
	if xspd == 0 && yspd == 0 {image_index = 0};
}

depth = -bbox_bottom;
