/// @description Aplicando o replay
if (global.pause) exit;

if (player.controle_volta > 0 and player.recuperacao_total) recuperando = true; //se estou recuperando o replay nao posso usa-lo!
else recuperando = false;

//---Voltando no tempo
var _replay = global.input[global.tipo_controle,CONTROLE.REPLAY];

if (_replay) and (!recuperando) voltando = !voltando;


// Verifica se tem limite e se podemos usar o replay
if (limite_replay > 0)
{
	if (voltando) and (!recuperando) and ((player.estado == state.movendo) or (player.estado == state.parado))
	{
		global.toreplay = true;
		

		if (array_length(desfazendo) > 0)
		{
			var _estado = array_pop(desfazendo); // Tira do topo da pilha
			
			with(player)
			{
				x = _estado.x;	
				y = _estado.y + other.diferenca;	
				image_ind = _estado.image_ind;
				xscale = _estado.xscale;
				yscale = _estado.yscale;
				spr_index = _estado.spr_index;
				ver = _estado.ver;
				carga = _estado.carga;
				estado = state.parado;
			}
			
			limite_replay--;
		}
	}
	else
	{
		// Tempo sendo gravado
		global.toreplay = false;
		
		// Adiciona o estado atual no final da array
		array_push(desfazendo, new scr_replay(player.x, player.y, player.image_ind, player.spr_index, player.xscale, player.yscale, player.ver, player.carga));
		
		// Evitando memory leak
		// Se a array ficou maior que o limite, deleta o registro mais antigo 
		if (array_length(desfazendo) > global.limite_global)
		{
			array_shift(desfazendo);
		}
	}
}

// Garantindo que eu saio do replay se a barra zerar ou a array esvaziar
if (limite_replay <= 0) or (array_length(desfazendo) == 0)
{
	global.toreplay = false;
	voltando = false;	
}

// Quando a barra zera, limpamos a array para liberar a memória restante
if (limite_replay <= 0) and (array_length(desfazendo) > 0)
{
	desfazendo = []; 
	global.limpeza = true;
}
else 
{
	global.limpeza = false;
}

// Liberando as coisas
if (global.limite_global > 200) global.primeiro_desbloqueio = true;