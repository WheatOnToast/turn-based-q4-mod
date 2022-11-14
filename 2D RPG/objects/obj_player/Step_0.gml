//tracking movement path
if(x != xprevious || y != yprevious){
	for(var i = array_size-1; i > 0; i--){
		pos_x[i] = pos_x[i-1];
		pos_y[i] = pos_y[i-1];
	}	
	pos_x[0] = x;
	pos_y[0] = y;
}

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

xspd = round((right_key - left_key) * move_spd); //right = 1 * move_spd, left = -1 * move_spd
yspd = round((down_key - up_key) * move_spd); // up = -1 * move_spd, down = 1 * move_spd

//pause
if instance_exists(obj_pauser)
{
	xspd = 0;
	yspd = 0;
}

//set sprite
mask_index = sprite[DOWN];
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
	if place_meeting(x + xspd, y , obj_wall) == true 
	{
		xspd = 0;	
	}
	if place_meeting(x , y + yspd, obj_wall) == true
	{
		yspd = 0;	
	}
	
	x += xspd;
	y += yspd;

	//animate
	if xspd == 0 && yspd == 0 {image_index = 0};
}
else if(move_status = move_state.STOP){
	image_index = 0;	
}
//depth

depth = -bbox_bottom;

