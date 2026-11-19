/// @description Step completo com atribuição individual de global.terra por amostra

var pad = -1;
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
        break;
    }
}

//INTRO
if (intro) {
    if (typist_intro.get_state() == 1.0) {
        intro = false;
    }
}
else {
    //FASE ATIVA DOS LEDS
    if (!espera) {
        
        // Botão do Sonar (Espaço / Botão 4) = Abortar e voltar para rm_1_terra sem amostra
        if (keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4))) {
            global.terra = "";
            room_goto(destino);
            exit;
        }

        // Navegação (Teclado + Botões 0, 1, 2, 3 + POTENCIOMETRO)
        var dir_direita  = keyboard_check_pressed(vk_right) || (pad != -1 && gamepad_button_check_pressed(pad, 2));
        var dir_esquerda = keyboard_check_pressed(vk_left)  || (pad != -1 && gamepad_button_check_pressed(pad, 0));
        var dir_baixo    = keyboard_check_pressed(vk_down)  || (pad != -1 && gamepad_button_check_pressed(pad, 1));
        var dir_cima     = keyboard_check_pressed(vk_up)    || (pad != -1 && gamepad_button_check_pressed(pad, 3));

        if (pad != -1) {
            var ax_h = gamepad_axis_value(pad, gp_axislh);
            var ax_v = gamepad_axis_value(pad, gp_axislv);
            if (abs(ax_h) > 0.5 || abs(ax_v) > 0.5) {
                if (stick_pode_mover) {
                    if (ax_h > 0.5)  dir_direita  = true;
                    if (ax_h < -0.5) dir_esquerda = true;
                    if (ax_v > 0.5)  dir_baixo    = true;
                    if (ax_v < -0.5) dir_cima     = true;
                    stick_pode_mover = false;
                }
            } else {
                stick_pode_mover = true;
            }
        }

        if (dir_direita)  cursor += 1;
        if (dir_esquerda) cursor -= 1;
        if (dir_baixo)    cursor += 8;
        if (dir_cima)     cursor -= 8;
        cursor = clamp(cursor, 0, 31);

        // Alternar LED (Enter ou Botão 5 / 8)
        var alternar_led = keyboard_check_pressed(vk_enter) || 
                           (pad != -1 && (gamepad_button_check_pressed(pad, 5) || gamepad_button_check_pressed(pad, 8)));

        if (alternar_led) {
            leds[cursor] = !leds[cursor];
            
            if (audio_exists(electronic_input__quick)) {
                audio_play_sound(electronic_input__quick, 4, false);
            }
            
            var _sequencia_atual = "";
            for (var i = 0; i < 32; i++) {
                _sequencia_atual += string(leds[i]);
                if ((i + 1) mod 8 == 0 && i < 31) _sequencia_atual += " ";
            }
            
            // Verifica automaticamente contra as 3 opções do ponto atual
            var _opcoes_do_ponto = gabaritos[ponto_atual];
            
            for (var j = 0; j < 3; j++) {
                if (_sequencia_atual == _opcoes_do_ponto[j]) {
                    sequencia_capturada = _sequencia_atual;
                    id_amostra_gerada   = ids_saida_terra[ponto_atual][j];
                    espera = true; // Avança para a tela neutra de coleta
                    break;
                }
            }
        }
    }
    //RESULTADO / COLETA (espera == true)
    else {
        // CONFIRMAR / COLETAR (Botão do Sonar: Espaço ou Botão 4)
        if (keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4))) {
            // Grava o ID único (1 a 6) da amostra escolhida para o obj_terminal ler no bunker
            global.terra = id_amostra_gerada;
            global.skip = true;
            room_goto(destino);
        }
        // RECUSAR / LARGAR (Qualquer Direcional)
        else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || 
                 keyboard_check_pressed(vk_up)   || keyboard_check_pressed(vk_down)  || 
                 (pad != -1 && (gamepad_button_check_pressed(pad, 3) || gamepad_button_check_pressed(pad, 1) || 
                                gamepad_button_check_pressed(pad, 0) || gamepad_button_check_pressed(pad, 2)))) {
            global.terra = "";
            room_goto(destino);
        }
    }
}