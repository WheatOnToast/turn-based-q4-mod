image_alpha = image_alpha - 0.05;

if(image_alpha >= 0.5){
	y = y - 1;
}

if(image_alpha == 0.8){
	for(i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
		if(obj_enemy_spawn.enemy_array[i].temp_hp <= 0){
			obj_enemy_spawn.enemy_array[i].death_flag = 1;
		}
	}
}


if(image_alpha<=0){
	instance_destroy();	
}


