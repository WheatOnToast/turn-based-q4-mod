depth = -9999;
//other variable initialization
receiver_selected = "";
item_selected = "";
calcd_hp = 0;

//inventory creation
inv = array_create(0);
//item constructor

//ITEM TYPES: 0 = HEAL, 1 = ATTACK
function item_create(_name, _desc, _spr,  _item_type, _effect, _animation) constructor{
	name = _name;
	desc = _desc;
	sprite = _spr;
	item_type = _item_type;
	effect = _effect;
	animation = _animation;
	bCost = 3
}

function item_give(_item){
	inv[array_length(inv)] = _item;
	audio_play_sound(snd_battle_notif, 1,false);
}

//item usage
function item_use(position, selected_item, selected_receiver){
	pos = position;
	receiver_selected = selected_receiver;
	item_selected = selected_item;
	selected_item.effect();
	selected_item.animation();
}

//item initialization
global.item_list =
	{
	
	//HEALING ITEMS
	null_item : new item_create(
		"",
		"",
		spr_blk,
		0,
		function()//item effect
			{},
		function()//animation
			{}
	),
	
	burger : new item_create(
		"Burger",
		"A burger! Restores 25 HP!",
		spr_blk,
		0,
		function()//item effect
			{
				audio_play_sound(snd_heal,2,0);
				receiver_selected.temp_hp += 25;
				calcd_hp = 25;
				if(receiver_selected.temp_hp > receiver_selected.hp){
					receiver_selected.temp_hp = receiver_selected.hp;
					calcd_hp = "MAX HP";
				}
				receiver_selected.battle_face.image_index = 1;
				array_delete(inv, pos, 1);
			},
		function()//animation
			{
				with(instance_create_depth(24, 144, -9999, obj_btl_heal)){
					calcd_heal = obj_item_manager.calcd_hp;
				}
				for(i = 0; i < 4; i++){
					rand_x = irandom_range(-8,24);
					instance_create_depth(obj_p1.x + rand_x, obj_p1.y, -9999, obj_heal);	
				}	
			}
		),
	
	superburger : new item_create(
		"Super Burger",
		"A big burger! Restores 50 HP!",
		spr_blk,
		0,
		function()//item effect
			{
				audio_play_sound(snd_heal,2,0);
				receiver_selected.temp_hp += 50;
				calcd_hp = 50;
				if(receiver_selected.temp_hp > receiver_selected.hp){
					receiver_selected.temp_hp = receiver_selected.hp;
					calcd_hp = "MAX HP";
				}
				
				receiver_selected.battle_face.image_index = 1;
				array_delete(inv, pos, 1);
			},
		function()//animation
			{
				with(instance_create_depth(24, 144, -9999, obj_btl_heal)){
					calcd_heal = obj_item_manager.calcd_hp;
				}
				for(i = 0; i < 8; i++){
					rand_x = irandom_range(-8,24);
					instance_create_depth(obj_p1.x + rand_x, obj_p1.y, -9999, obj_heal);	
				}	
			}
		),
	
	
	//ATTACKING ITEMS
	bomb: new item_create(
		"Bomb",
		"Does 40 damage to all enemies",
		spr_blk,
		1,
		function()//item effect
			{
				for(var i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
					obj_enemy_spawn.enemy_array[i].temp_hp = obj_enemy_spawn.enemy_array[i].temp_hp - 40;
				}	
				array_delete(inv, pos, 1);
			},
		function()//animation
			{
				with(instance_create_depth(0, 0, -999999, obj_anim_bomb))
				{
					damage = 40;	
				}
			}
		),
		
	superbomb: new item_create(
		"Superbomb",
		"Does 100 damage to all enemies",
		spr_blk,
		1,
		function()//item effect
			{
				for(var i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
					obj_enemy_spawn.enemy_array[i].temp_hp = obj_enemy_spawn.enemy_array[i].temp_hp - 100;
				}	
				array_delete(inv, pos, 1);
			},
		function()//animation
			{
				with(instance_create_depth(0, 0, -999999, obj_anim_bomb))
				{
					damage = 100;	
				}
			}
		),
	}	//------------end of item list------------------------------
//------------end of item list------------------------------