/// @description Aplicando o giro
if (global.pause) exit;


if (!global.toreplay) loop += .1;
else loop -= .1;
image_xscale = sin(loop)




