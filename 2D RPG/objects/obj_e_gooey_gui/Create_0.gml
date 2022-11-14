e_name = "Gooey GUI";
e_sprite = spr_gooey_gui;
depth = -999;

e_attacks = [global.atk_list.Bash, global.atk_list.wimpy_tackle];
e_magicAttacks = [global.atk_list.Zap];

type = atkElements.GOO;

hp = 50;
mp = 10;
xp = 150;

temp_hp = 50;
temp_mp = 10;
temp_xp = 150;

death_flag = 0;
death_anim_flag = 0;

shadow = instance_create_depth(x+8, y+52, 1, obj_e_shadow);
