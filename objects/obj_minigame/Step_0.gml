var pad = -1; // invoca o controle
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
        break;
    }
}

if (intro) {
    if (typist_intro.get_state() == 1.0) {
        intro = false;
    }
}
else {
    if (!espera) {
        if (!audio_is_playing(distorted_audio_transmission)) {
            audio_play_sound(distorted_audio_transmission, 2, false);
        }
        
        // --- CONTROLE DO SOM CONTÍNUO (HUMMING/CRACKLE) ---
        var mexendo_amp = false;

        // 1. AMPLITUDE (Potenciômetro no Eixo X OU Setas Cima/Baixo)
        if (pad != -1 && abs(gamepad_axis_value(pad, gp_axislh)) > 0.01) {
            var eixo_x = gamepad_axis_value(pad, gp_axislh); // Retorna de -1.0 a 1.0
            player_amplitude = (eixo_x + 1) * 40;            // Converte para a escala de 0 a 80
            mexendo_amp = true;
        } else {
            if (keyboard_check(vk_up)) {
                player_amplitude += 0.4;
                mexendo_amp = true;
            }
            if (keyboard_check(vk_down)) {
                player_amplitude -= 0.4;
                mexendo_amp = true;
            }
        }

        // Toca o som contínuo enquanto interage; para/pausa quando solta
        if (mexendo_amp) {
            if (!audio_is_playing(electrical_light_crackle_hum)) {
                audio_play_sound(electrical_light_crackle_hum, 3, true); // Loop ligado
            }
        } else {
            audio_stop_sound(electrical_light_crackle_hum);
        }

        // --- FREQUÊNCIA (Alavancas 5 e 6 OU Setas Esquerda/Direita) ---
        var freq_mais  = keyboard_check(vk_right) || (pad != -1 && gamepad_button_check(pad, 5));
        var freq_menos = keyboard_check(vk_left)  || (pad != -1 && gamepad_button_check(pad, 6));
        
        // Disparo do som rápido de clique/input
        var freq_press = keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left) ||
                         (pad != -1 && (gamepad_button_check_pressed(pad, 5) || gamepad_button_check_pressed(pad, 6)));
        
        if (freq_press) {
            audio_play_sound(electronic_input__quick, 4, false);
        }

        if (freq_mais)  player_frequencia += 0.0004;
        if (freq_menos) player_frequencia -= 0.0004;

        // --- VELOCIDADE (Encoder rotativo 8 e 7 OU Teclas W e S) ---
        var vel_mais  = keyboard_check(ord("W")) || (pad != -1 && gamepad_button_check(pad, 8));
        var vel_menos = keyboard_check(ord("S")) || (pad != -1 && gamepad_button_check(pad, 7));
        
        if (vel_mais)  player_velocidade += 0.5;
        if (vel_menos) player_velocidade -= 0.5;

        player_fase += player_velocidade * 0.05;  
        alvo_fase += alvo_velocidade * 0.05;

        player_amplitude = clamp(player_amplitude, 0, 80);
        player_frequencia = clamp(player_frequencia, 0.01, 0.10);
        player_velocidade = clamp(player_velocidade, 0, 5);
        
        var diff_amp  = abs(player_amplitude - alvo_amplitude);
        var diff_freq = abs(player_frequencia - alvo_frequencia);
        var diff_vel  = abs(player_velocidade - alvo_velocidade);
        var diff_fase = abs(player_fase - alvo_fase);
        
        diff_fase = diff_fase mod (2 * pi);
        if (diff_fase > pi) diff_fase = (2 * pi) - diff_fase;

        // VALIDAÇÃO DE SINTONIA
        if (diff_amp <= tolerancia && diff_freq <= 0.007 && diff_fase <= 0.5 && diff_vel <= 0.4) {
            // Para o som de zumbido/hum ao concluir a sintonia
            audio_stop_sound(electrical_light_crackle_hum);

            if (global.binary == 1) {
                espera = true;
                destino = rm_1_terra;
                global.binary -= 1;
            }
            else if (global.binary == 2) {
                espera = true;
                destino = rm_3_air;
                global.binary -= 2;
            }
            else if (global.binary == 3) {
                espera = true;
                destino = rm_4_agua;
                global.binary -= 3;
            }
        }
    }
    else {
        // Garante que o som de humming pare se o minigame entrar na fase de espera/resultado
        audio_stop_sound(electrical_light_crackle_hum);

        // CONFIRMAR (Pegar a amostra - Botão de Espaço/Sonar)
        if (keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4))) { 
            global.skip = true;
            room_goto(destino);
            audio_stop_sound(distorted_audio_transmission);
        }
        
        // RECUSAR (Descartar a amostra - Qualquer Direcional)
        else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || 
                 keyboard_check_pressed(vk_up)   || keyboard_check_pressed(vk_down)  || 
                 (pad != -1 && (gamepad_button_check_pressed(pad, 3) || gamepad_button_check_pressed(pad, 1) || 
                                gamepad_button_check_pressed(pad, 0) || gamepad_button_check_pressed(pad, 2)))) {
            
            if (destino == rm_1_terra) {
                global.terra = "";
            } 
            else if (destino == rm_3_air) {
                global.air = "";
            }
            else if (destino == rm_4_agua) {
                global.water = "";
            }
            
            room_goto(destino);
            audio_stop_sound(distorted_audio_transmission);
        }
    }
}