

draw_self()



if (global.debug)
{
    draw_set_halign(1)
    draw_set_valign(1)
    draw_text(x,y-sprite_height,estado)
    draw_set_halign(0)
    draw_set_valign(0)

    //Desenhendo 6milhoes de visao
    draw_circle(x,y,campo_visao,true);
}

