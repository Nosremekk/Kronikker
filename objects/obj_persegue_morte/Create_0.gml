tamanho_x = (room_width/sprite_width);
tamanho_y = (room_height/sprite_height);

if (tipo == "vertical") and (vel_expansao > 0) image_yscale = -1;
else if (tipo == "horizontal") and (vel_expansao < 0) image_xscale = 1;

