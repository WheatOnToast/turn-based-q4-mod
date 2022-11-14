e_name = "Mr. Mage";
e_sprite = spr_mrmage;
depth = -999;

e_attacks = [global.atk_list.wimpy_tackle];
e_magicAttacks = [global.atk_list.Flow];

type = atkElements.WATER;

hp = 40;
mp = 10;
xp = 150;

temp_hp = 40;
temp_mp = 10;
temp_xp = 150;

death_flag = 0;
death_anim_flag = 0;

shadow = instance_create_depth(x+8, y+52, 1, obj_e_shadow);
