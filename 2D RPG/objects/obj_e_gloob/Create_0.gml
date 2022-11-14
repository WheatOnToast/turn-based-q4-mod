e_name = "Gloob";
e_sprite = spr_gloob;
depth = -999;

e_attacks = [global.atk_list.Bash_Plus];
e_magicAttacks = [global.atk_list.Blaze];

type = atkElements.FIRE;

hp = 30;
mp = 10;
xp = 150;

temp_hp = 30;
temp_mp = 10;
temp_xp = 150;

death_flag = 0;
death_anim_flag = 0;

shadow = instance_create_depth(x+8, y+52, 1, obj_e_shadow);
