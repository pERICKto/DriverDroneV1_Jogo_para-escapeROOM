if (minigame_concluido) {
    exit;
}

// --- 1. NAVEGAÇÃO PELA GRADE 8x4 ---
if (keyboard_check_pressed(vk_right)) cursor += 1;
if (keyboard_check_pressed(vk_left))  cursor -= 1;
if (keyboard_check_pressed(vk_down))  cursor += 8; // Desce 1 linha inteira (8 LEDs)
if (keyboard_check_pressed(vk_up))    cursor -= 8; // Sobe 1 linha inteira (8 LEDs)

// Mantém o cursor sempre dentro dos índices válidos (0 a 31)
cursor = clamp(cursor, 0, 31);

// verificacao automatica para a conclusao do minigame
if (keyboard_check_pressed(vk_space)) {
    
    // Inverte o bit atual (se era 0 vira 1; se era 1 vira 0)
    leds[cursor] = !leds[cursor];
    
    // Converte o array atual de 32 números em uma string formatada em bytes (ex: "01000011 ...")
    var _sequencia_atual = "";
    for (var i = 0; i < 32; i++) {
        _sequencia_atual += string(leds[i]);
        
        // Adiciona um espaço separador a cada 8 bits (exceto após o 32º bit)
        if ((i + 1) mod 8 == 0 && i < 31) {
            _sequencia_atual += " ";
        }
    }
    
    // Compara automaticamente a sequência formada com as 3 opções do ponto atual
    var _opcoes_do_ponto = gabaritos[ponto_atual];
    var _indice_correto  = resposta_correta_por_ponto[ponto_atual];
    
    for (var j = 0; j < 3; j++) {
        if (_sequencia_atual == _opcoes_do_ponto[j]) {
            amostra_liberada = j; // Registra qual das 3 amostras foi destravada
            
            // Verifica se a amostra destravada é a amostra correta exigida pelo documento
            if (j == _indice_correto) {
                minigame_concluido = true;
                // Aqui você poderá disparar o som de sucesso, salvar a variável global ou voltar à sala
            }
            break;
        }
    }
}