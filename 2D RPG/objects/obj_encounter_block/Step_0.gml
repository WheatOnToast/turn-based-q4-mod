if (i == 0)
{
	if (place_meeting(x, y, obj_player))
	{
		saved_coords_x = x;
		saved_coords_y = y;
		
		encounter = irandom(10);
		if (encounter = 1 && !instance_exists(obj_encounter) || keyboard_check(ord("P")))
		{
				obj_player.move_status = move_state.STOP;
				audio_stop_all();
				audio_play_sound(snd_battle_notif,1,false);
				instance_create_depth(camera_get_view_x(view_camera[0]) - 8, camera_get_view_y(view_camera[0]), -9999999, obj_btl_lines);
				instance_create_depth(obj_player.x - 8, obj_player.y - 36, -99999, obj_exclamation);
				if(alarm[0] <= -1){
					alarm[0] = 40;	
					global.last_x = obj_player.x;
					global.last_y = obj_player.y;
					global.last_room = room;
				}
			
		}
	}
}
i = 1;

if (place_meeting(x, y, obj_player) == false)
{
	i = 0;
}

