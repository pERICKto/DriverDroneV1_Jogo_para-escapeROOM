//seguir o jogador
// Verifica se a instância salva ainda existe para evitar erros




radius = 50;

// PAREDES
for (var i = 0; i < n_paredes; i++) {
    if (dist_paredes[i] <= radius) {
        var _inst = lista_paredes[| i];
		
        
        if (instance_exists(_inst) && !_inst.fading) {
            _inst.image_alpha = 0.3;
            _inst.fading = true;
				audio_play_sound(motion_tracker_null_ping,1,false);
            ds_list_add(obj_camera.lista_fade, _inst); 
        }
    }
}

// PONTOS
for (var i = 0; i < n_pontos; i++) {
    // Agora só exige que o raio chegue no ponto, ignorando as paredes
    if (dist_pontos[i] <= radius) {
        var _inst = lista_pontos[| i];


		
        if (instance_exists(_inst) && !_inst.fading) {
            _inst.image_alpha = 0.6;
            _inst.fading = true;
            cor_sonar = c_yellow; 
            ds_list_add(obj_camera.lista_fade, _inst); 
        }
    }
}

