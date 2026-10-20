// camera e suiavizacao
if (instance_exists(target_)) {
    x = lerp(x, target_.x, 0.25);
    y = lerp(y, target_.y - height_ / 80, 0.25);
}


//sonar, cooldown e penalidades no raio de precisao maximo
// 1. Define qual é o limite máximo que o PCR pode recarregar
var pcr_max = 100; // Começa assumindo 100 por padrão

if (instance_exists(obj_batery)) {
    penalidade = obj_batery.batery_estado;
    if (penalidade == 4 || penalidade == 3) pcr_max = 100;
    if (penalidade == 2) pcr_max = 75;
    if (penalidade == 1) pcr_max = 50;
    if (penalidade == 5) pcr_max = 10;
}


if (instance_exists(obj_Sonar_player)) {
    // Gasta o PCR até chegar a zero
    if (pcr > 0) {
        pcr -= 1;
    } else {
        // instance_destroy(obj_Sonar_player);
    }
}

// 3. O SONAR ESTÁ DESLIGADO (Recarregando o PCR)
else {
    
    // Recarrega mais rápido (3) se a bateria estiver boa, ou lento (1) se estiver ruim
    var vel_recarga = (pcr_max == 100) ? 3 : 1; 
    
    // Se o PCR atual for menor que o limite máximo, ele recarrega
    if (pcr < pcr_max) {
        pcr += vel_recarga;
    }
    
    // Trava de segurança: impede que o PCR passe do teto máximo se a bateria cair de repente
    if (pcr > pcr_max) {
        pcr = pcr_max;
    }

    // Cor do Sonar DESLIGADO/RECARREGANDO
    cor_sonar_raio_hud = c_red; 
}

    // Cores do Sonar LIGADO
    if (pcr >= 95) {
        cor_sonar_raio_hud = c_green;
    } 
    else if (pcr >= 77) {
        cor_sonar_raio_hud = c_yellow;
    }
    else {
        cor_sonar_raio_hud = c_red;
    }

var hud_altura = 128;//tamanho hud

switch (room) {
    case rm_intro:
    case rm_1_terra:
    case rm_2_bunker:
    case rm_3_air:
        var _view_x = clamp(x - width_ / 2, 0, room_width - width_);
        var _view_y = clamp(y - height_ / 2.63, 0, room_height - height_ + hud_altura);
        camera_set_view_pos(view_camera[0], _view_x, _view_y);
        break; 
        
    case rm_4_agua:
    case rm_victory:
        var _view_x = clamp(x - width_ / 2, 0, room_width - width_);
        var _view_y = clamp(y - height_ / 2, 0, room_height - height_ + hud_altura);
        camera_set_view_pos(view_camera[0], _view_x, _view_y);
        break;
}

//otimização dos ponto pq tem pra crlh
for (var i = ds_list_size(lista_fade) - 1; i >= 0; i--)
{
    var _inst = lista_fade[| i];
    
    if (!instance_exists(_inst))
    {
        ds_list_delete(lista_fade, i);
        continue;
    }
    

    // A velocidade de base para paredes
    var _vel_fade = 0.01; 
    
    // aumenta especificamente o tempo de fade out do ponto de interesse
    if (_inst.object_index == obj_ponto) {
        _vel_fade = 0.01 / 12; 
    }
    
    _inst.image_alpha -= _vel_fade;
    // ----------------------------
    
    if (_inst.image_alpha <= 0)
    {
        _inst.image_alpha = 0;
        _inst.fading = false; // libera pra poder entrar na lista de novo no futuro
        ds_list_delete(lista_fade, i);
    }
}

if (global.player_is_moving == true) {
    // point_distance calcula quantos pixels o player andou exatemente neste frame
}