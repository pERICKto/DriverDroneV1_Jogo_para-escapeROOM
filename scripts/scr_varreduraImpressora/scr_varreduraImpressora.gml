function scr_gerar_relatorio_radar() {
    var _pasta = environment_get_variable("USERPROFILE") + "\\Downloads\\";
    var _caminho = _pasta + "pontos_interesse.txt";
    
    var _arquivo = file_text_open_write(_caminho);
    if (_arquivo == -1) return; // Se houver erro ao abrir, cancela
    
    // Cabeçalho do arquivo
    file_text_write_string(_arquivo, "=== RELATORIO DE VARREDURA TATACO-RADAR ===");
    file_text_writeln(_arquivo);
    
    var _contador_amostra = 1; // Contador para mapear sequencialmente cada obj_ponto à sua respectiva variável global (1, 2, 3...)
    
    // Percorre cada ponto de interesse existente na sala
    with (obj_ponto) {
        // 1. Cálculo da Coluna (4, 3, 2, 1 da esquerda para a direita)
        var _pct_x = clamp(x / room_width, 0, 0.999);
        var _coluna = 4 - floor(_pct_x * 4); 
        
        // 2. Cálculo da Linha (A, B, C de cima para baixo)
        var _pct_y = clamp(y / room_height, 0, 0.999);
        var _indice_linha = floor(_pct_y * 3); 
        var _linha = "A";
        if (_indice_linha == 1) _linha = "B";
        else if (_indice_linha == 2) _linha = "C";
        
        var _coordenada = _linha + string(_coluna); // Ex: B2, A4, etc.
        
        // 3. Buscar o texto binário com base na sala e no índice da amostra (global.terra, global.air, global.water)
        var _binario_texto = "DESCONHECIDO";
        
        switch (room) {
            case rm_1_terra:
                if (_contador_amostra == 1)      _binario_texto = "01000011 01000001 : 00110110 00110000 %";
                else if (_contador_amostra == 2) _binario_texto = "01001110 01000001 : 00110001 00110000 %";
                else if (_contador_amostra == 3) _binario_texto = "01000011 01000001 : 00110000 00110101 %";
                else if (_contador_amostra == 4) _binario_texto = "01000001 01001100 : 00110000 00111000 %";
                else if (_contador_amostra == 5) _binario_texto = "01001111 : 00110100 00111000 %";
                else if (_contador_amostra == 6) _binario_texto = "smelly organic material... better leave it alone";
                break;
                
            case rm_3_air:
                if (_contador_amostra == 1)      _binario_texto = "#00110110 01000010 00110010 01000011 00111001 00110001";
                else if (_contador_amostra == 2) _binario_texto = "#00111000 01000010 00110011 01000001 00110010 01000110";
                else if (_contador_amostra == 3) _binario_texto = "#01000001 00110100 00110101 01000011 00110011 00110010";
                else if (_contador_amostra == 4) _binario_texto = "#00110011 01000110 00110101 01000010 00110011 01000001";
                else if (_contador_amostra == 5) _binario_texto = "#00110010 01100010 00110010 01100010 00110010 00111000";
                else if (_contador_amostra == 6) _binario_texto = "#0110001 00110111 00110000 01100101 00110000 00110000";
                break;
                
            case rm_4_agua:
                if (_contador_amostra == 1)      _binario_texto = "00110011 * 00110010 / 00110001";
                else if (_contador_amostra == 2) _binario_texto = "00110010 * 00110101 / 00110001";
                else if (_contador_amostra == 3) _binario_texto = "00110010 * 00110101 / 00110001";
                else if (_contador_amostra == 4) _binario_texto = "00110010 * 00110001 00110000 / 00110010";
                else if (_contador_amostra == 5) _binario_texto = "00110010 * 00110001 00110000 / 00110010";
                else if (_contador_amostra == 6) _binario_texto = "just some debris";
                else if (_contador_amostra == 7) _binario_texto = "a bunch of rock and metal";
                break;
        }
        
        // Escreve no formato exato: COORDENADA : TEXTO BINARIO
        file_text_write_string(_arquivo, _coordenada + " : " + _binario_texto);
        file_text_writeln(_arquivo);
        
        _contador_amostra++; // Avança para a próxima amostra/ponto
    }
    
    file_text_close(_arquivo);
}