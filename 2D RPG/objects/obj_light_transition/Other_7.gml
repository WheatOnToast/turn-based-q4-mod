obj_book.image_blend = c_white;
instance_destroy(obj_red);
instance_create_depth(0,0,-99999, obj_white_fadeout);
instance_create_depth(0,0,-9000, obj_white);
instance_create_depth(0,0,-9999,obj_black_sparkle_rand);
obj_book.depth = 9999;
obj_book_no_orb.depth = -9999;
image_speed = -1;
