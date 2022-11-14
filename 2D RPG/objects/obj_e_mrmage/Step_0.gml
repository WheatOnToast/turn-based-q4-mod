if(id.temp_hp <= 0 && id.death_flag == 1){
	prev_phase = obj_player_menu.phase;
	obj_player_menu.phase = "pause";
	obj_player_menu.numOfEnemies--;
	temp_hp = 0;
	alarm[0] = 50; //instance_deactivate_object(id);
	id.death_flag = 0;
}

if(death_anim_flag == 1){
	image_blend = c_red;
	image_alpha -= 0.03;
	shadow.image_alpha -=0.03; 
	if(image_alpha <= 0){
		death_anim_flag = 0;
		instance_deactivate_object(id);
		instance_deactivate_object(shadow);
		obj_player_menu.phase = prev_phase;
	}
}
