image_speed = 0;
image_index = image_number - 1;
obj_player_menu.fight_state = battle_state.USING;
for(i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
	if(instance_exists(obj_enemy_spawn.enemy_array[i])){
		with(instance_create_depth(obj_enemy_spawn.enemy_array[i].x+22, obj_enemy_spawn.enemy_array[i].y+48, -999999, obj_btl_dmg))
		{
			c_damage = obj_anim_bomb.damage;	
			c_enemy = obj_enemy_spawn.enemy_array;
			enemy_index = obj_anim_bomb.i;
		}	
	}
}
instance_destroy();
