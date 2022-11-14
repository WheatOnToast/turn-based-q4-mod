image_alpha = image_alpha - 0.03;

if(image_alpha >= 0.5){
	y = y - 1;
}

if(image_alpha<=0){
	instance_destroy();	
}

