if (room == target_ROOM && image_index =1){ //checa se o player mudou de sala e a animation chegou ao fim (spr 8, para destruir a transicao)
	global.trocou_de_sala = false;
instance_destroy();
}