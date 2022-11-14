if (image_speed > 0){
	if (image_index > image_number - 1) {
		for(i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
			with(instance_create_depth(obj_enemy_spawn.enemy_array[i].x+22, obj_enemy_spawn.enemy_array[i].y+48, -999999, obj_btl_dmg))
			{
				c_damage = obj_atk_lib.dmg_array;
				c_enemy = obj_enemy_spawn.enemy_array;
				enemy_index = obj_anim_deathblow.i;
			}		
		}
		instance_destroy();
	}
}

