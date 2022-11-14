with(instance_create_depth(0,0, -999999999, obj_encounter))
{
	target_rm = global.last_room
	target_x = global.last_x;
	target_y = global.last_y;
	target_face = DOWN;
}	
instance_destroy(obj_btl_lines);
/*room = global.last_room;
obj_player.x = global.last_x;
obj_player.y = global.last_y;*/