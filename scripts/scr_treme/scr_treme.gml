// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_treme(_range = 1,_tempo = 5,_layer = layer)
{

var _objshake = instance_create_layer(x,y,_layer,obj_shake)
_objshake.shake = true;
_objshake.range = _range;
_objshake.tempo = _tempo;
}