if(obj_player.x < 128){
	x = 128;	
}
else if(obj_player.x > 590){
	x = 590;	
}
else{
	x = obj_player.x;	
}

if(keyboard_check(vk_left) && obj_player.x > 128 && obj_player.x < 590){
	image_speed = 0.15;
}
else if(keyboard_check(vk_right) && obj_player.x > 128 && obj_player.x < 590){
	image_speed = -0.15;
}
else{
	image_speed = 0;
}

