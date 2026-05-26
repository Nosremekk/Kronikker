parar = false;
meu_trampolim = noone;

plataforma = []; 

minha_alavanca = noone;

//Criando a alavanca
if (alavanca)
{
	minha_alavanca = instance_create_layer(x_alavanca,y_alavanca,layer,obj_alavanca);
	minha_alavanca.pai = self;
	minha_alavanca.id_alavanca = id_alavanca;
}





