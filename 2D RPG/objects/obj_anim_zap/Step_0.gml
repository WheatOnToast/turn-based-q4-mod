if (image_speed > 0){
	if (image_index > image_number - 1) {
		instance_create_depth(c_enemy.x+25, c_enemy.y+48, -999, obj_btl_dmg);
		instance_destroy();
	}
}

