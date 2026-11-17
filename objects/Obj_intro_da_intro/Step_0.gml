 
if(tocou_ligando==false)
	{
		audio_play_sound(sfx_iniciando_jogo,1,false);
	tocou_ligando=true;
	}

switch (estado_tv) {
    case 0: 
        estado_tv = 1;
    break;

    case 1: // expandindo Horizontalmente (Vira uma linha)
        luz_w += vel_w;
        
        // se a linha já cobriu a largura da tela...
        if (luz_w >= alvo_w) {
            luz_w = alvo_w; 
            estado_tv = 2;  
        }
    break;

    case 2: // Expandindo Verticalmente (A linha vira a tela cheia)
        luz_h += vel_h;
        if (luz_h >= alvo_h) {
            luz_h = alvo_h;
            instance_destroy(); 
        }
    break;
}


