//loop de respiração
radius += direcao_resp * velocidade_resp;

if (radius >= raio_maximo) {
    radius = raio_maximo;
    direcao_resp = -1; // Começa a encolher
}
else if (radius <= raio_minimo) {
    radius = raio_minimo;
    direcao_resp = 1;  // Começa a expandir de novo
}

// mini sonar
ds_list_clear(lista_paredes);
ds_list_clear(lista_pontos);

collision_circle_list(x, y, radius, obj_wall, false, true, lista_paredes, false);
collision_circle_list(x, y, radius, obj_ponto, false, true, lista_pontos, false);

var n_paredes = ds_list_size(lista_paredes);
for (var i = 0; i < n_paredes; i++) {
    var _inst = lista_paredes[| i];
    
    //se o sonar está expandindo e a parede não está em fade ativo, acende!
    if (direcao_resp == 1  && instance_exists(_inst) && !_inst.fading) {
        _inst.image_alpha = 0.3;
        _inst.fading = true;
        
        if (!audio_is_playing(motion_tracker_null_ping)) {
            audio_play_sound(motion_tracker_null_ping, 1, false, 0.4);
        }
        
        if (instance_exists(obj_camera)) {
            ds_list_add(obj_camera.lista_fade, _inst);  
        }
    }
}

//proscssa os Pontos detetados dinamicamente
var n_pontos = ds_list_size(lista_pontos);
for (var i = 0; i < n_pontos; i++) {
    var _inst = lista_pontos[| i];
    
    if (direcao_resp == 1 && instance_exists(_inst) && !_inst.fading) {
        _inst.image_alpha = 0.6;
        _inst.fading = true;
        cor_sonar = c_yellow;  
        
        if (instance_exists(obj_camera)) {
            ds_list_add(obj_camera.lista_fade, _inst);  
        }
    }
}