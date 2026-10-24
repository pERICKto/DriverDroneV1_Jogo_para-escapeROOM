var pad = -1;	 //invoca o controle
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
        
        // 1. AMPLITUDE (Potenciômetro no Eixo X OU Setas Cima/Baixo)
        // Se o painel estiver conectado, a posição do knob dita a amplitude absoluta.
        if (pad != -1 && abs(gamepad_axis_value(pad, gp_axislh)) > 0.01) {
            var eixo_x = gamepad_axis_value(pad, gp_axislh); // Retorna de -1.0 a 1.0
            player_amplitude = (eixo_x + 1) * 40;            // Converte para a escala de 0 a 80
        } else {
            if (keyboard_check(vk_up))   player_amplitude += 0.4;
            if (keyboard_check(vk_down)) player_amplitude -= 0.4;
        }

//(Alavancas 5 e 6 OU Setas Esquerda/Direita)
        var freq_mais  = keyboard_check(vk_right) || (pad != -1 && gamepad_button_check(pad, 5));
        var freq_menos = keyboard_check(vk_left)  || (pad != -1 && gamepad_button_check(pad, 6));
        
        if (freq_mais)  player_frequencia += 0.0004;
        if (freq_menos) player_frequencia -= 0.0004;

//(Encoder 8 e 7 OU Teclas W e S)
        var vel_mais  = keyboard_check(ord("W")) || (pad != -1 && gamepad_button_check(pad, 8));
        var vel_menos = keyboard_check(ord("S")) || (pad != -1 && gamepad_button_check(pad, 7));
        
        if (vel_mais)  player_velocidade += 0.5;
        if (vel_menos) player_velocidade -= 0.5;

        // 3. VELOCIDADE/FASE (Encoder 8 e 7 OU Teclas W e S)
        var vel_mais  = keyboard_check(ord("W")) || (pad != -1 && gamepad_button_check(pad, 8));
        var vel_menos = keyboard_check(ord("S")) || (pad != -1 && gamepad_button_check(pad, 7));
        
        if (vel_mais)  player_velocidade += 0.5;
        if (vel_menos) player_velocidade -= 0.5;


        // -------------------------------------------------------------
        // CÁLCULOS DA ONDA (Mantidos exatamente iguais)
        // -------------------------------------------------------------
        player_fase += player_velocidade * 0.05;  
        alvo_fase += alvo_velocidade * 0.05;

        player_amplitude = clamp(player_amplitude, 0, 80);
        player_frequencia = clamp(player_frequencia, 0.01, 0.10);
        player_velocidade = clamp(player_velocidade, 0, 5);
        var diff_amp = abs(player_amplitude - alvo_amplitude);
        var diff_freq = abs(player_frequencia - alvo_frequencia);
        var diff_vel  = abs(player_velocidade - alvo_velocidade);
        var diff_fase = abs(player_fase - alvo_fase);
        
        diff_fase = diff_fase mod (2 * pi);
        if (diff_fase > pi) diff_fase = (2 * pi) - diff_fase;

        // VALIDAÇÃO DE SINTONIA
        if (diff_amp <= tolerancia && diff_freq <= 0.009 && diff_fase <= 0.7 && diff_vel <= 0.6) {
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
			 else if (global.binary == 3)
            {
                espera = true;
                destino = rm_4_agua;
                global.binary -= 3;
            }
        }
    }
    else
    {
        // CONFIRMAR (Pegar a amostra - Botão de Espaço/Sonar)
        if (keyboard_check_pressed(vk_space)|| (pad != -1 && gamepad_button_check_pressed(pad, 4)))
        { 
			global.skip = true;
            room_goto(destino);
        }
        
        // RECUSAR (Descartar a amostra - Qualquer Direcional)
        else if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || 
                          keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down) || 
                          (pad != -1 && (gamepad_button_check_pressed(pad, 3) || gamepad_button_check_pressed(pad, 1) || gamepad_button_check_pressed(pad, 0) || gamepad_button_check_pressed(pad, 2))))
        {
            // Limpa a amostra da mão do jogador e NÃO adiciona no global.usado
            if (destino == rm_1_terra) 
			{
                global.terra = "";
            } 
            else if (destino == rm_3_air) 
			{
                global.air = "";
            }
			 else if (destino == rm_4_agua) 
			{
                global.water = "";
            }
            
            room_goto(destino);
        }
    }
}