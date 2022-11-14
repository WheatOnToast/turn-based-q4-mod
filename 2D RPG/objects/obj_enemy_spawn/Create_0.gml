depth = -99999999;

prev_room = global.last_room;
switch(prev_room)
{
	case rm_mabel_bed_room:	
		e_list= [obj_e_gloob, obj_e_gloob, obj_e_gloob, obj_e_gloob, obj_e_gloob,
		obj_e_gloob, obj_e_gloob, obj_e_gloob, obj_e_gloob, obj_e_gloob]
		break;
	
	case rm_yellow_1:
		e_list= [obj_e_gloob, obj_e_mrmage, obj_e_gloob, obj_e_mrmage, obj_e_noser, obj_e_mrmage,
				obj_e_gooey_gui, obj_e_gooey_gui, obj_e_gooey_gui, obj_e_gooey_gui]
		break;
	default:
		e_list= [obj_e_gloob, obj_e_mrmage, obj_e_gloob, obj_e_mrmage, obj_e_gloob, obj_e_mrmage,
				obj_e_gloob, obj_e_mrmage, obj_e_gloob, obj_e_mrmage]
		break;
}

randomize();
				
e_choice = e_list[random(9)];
e_size[0] = e_choice;

if(random(99) <= 60){
	e_choice = e_list[random(9)];	
	e_size[1] = e_choice;	
	
	if(random(99) <= 50){
		e_choice = e_list[random(9)];
		e_size[2] = e_choice;
	}
}


switch(array_length(e_size)){
	case 1:
		//initialize enemy array
		enemy_array[0] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x, obj_enemy_spawn.y-8, 1, e_size[0]);
		break;
	case 2:
		//initialize enemy array
		enemy_array[0] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x-32, obj_enemy_spawn.y-8, 1, e_size[0]);	
		enemy_array[1] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x+32, obj_enemy_spawn.y-8, 1, e_size[1]);
		break;
	case 3:
		//initialize enemy array
		enemy_array[0] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x-64, obj_enemy_spawn.y-8, 1, e_size[0]);	
		enemy_array[1] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x, obj_enemy_spawn.y-8, 1, e_size[1]);
		enemy_array[2] = instance_create_depth(camera_get_view_x(view_camera[0])+obj_enemy_spawn.x+64, obj_enemy_spawn.y-8, 1, e_size[2]);
		break;
}
