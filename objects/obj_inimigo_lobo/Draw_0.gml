/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor


draw_self();

if (global.debug)
{
	draw_set_halign(1)
    draw_set_valign(1)
    draw_text(x,y-sprite_height,estado)
    draw_set_halign(0)
    draw_set_valign(0)
	
    draw_rectangle(x,y,x+ (campo_visao * image_xscale),y-48,true);
}

if (velh != 0) ver = sign(velh);

image_xscale = ver;