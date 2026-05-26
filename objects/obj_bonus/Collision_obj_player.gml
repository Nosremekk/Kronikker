if (desbloqueio) exit;

if (global.toreplay) exit;

if (other.carga < other.limite_carga) and (!sumir)
{
other.carga++;
image_alpha = 0;

scr_treme(1,2);

sumir = true;


}

