depth = -9999;
xspd = 0;
yspd = 0;

array_size = 24;
for(var i = array_size-1; i >= 0; i--){
	pos_x[i] = x;
	pos_y[i] = y;
}
move_spd = 1;

enum move_state {STOP, GO};
move_status = move_state.GO;


sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[LEFT] = spr_player_left;
sprite[DOWN] = spr_player_down;

face = DOWN;

//var follower = instance_create_depth(x,y,-9999,obj_will);
//follower.record = 5;
