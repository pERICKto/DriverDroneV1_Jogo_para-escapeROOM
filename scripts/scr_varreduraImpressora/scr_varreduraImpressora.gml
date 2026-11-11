
function scr_gerar_relatorio_radar() {
    var _pasta = environment_get_variable("USERPROFILE") + "\\Downloads\\";
    var _caminho = _pasta + "pontos_interesse.txt";
    
    var _arquivo = file_text_open_write(_caminho);
    if (_arquivo == -1) return; // Se houver erro ao abrir, cancela
    
    //seta criacao arquivo 
    file_text_write_string(_arquivo, "=== RELATORIO DE VARREDURA TATACO-RADAR ===");
    file_text_writeln(_arquivo);
    
    // Percorre cada ponto de interesse existente na sala
    with (obj_ponto) {
        //Cálculo da Coluna (4, 3, 2, 1 da esquerda para a direita)
        var _pct_x = clamp(x / room_width, 0, 0.999);
        var _coluna = 4 - floor(_pct_x * 4); // Mapeia 0-25% -> 4, 25-50% -> 3, etc.
        
        //Cálculo da Linha (A, B, C de cima para baixo)
        var _pct_y = clamp(y / room_height, 0, 0.999);
        var _indice_linha = floor(_pct_y * 3); // 0, 1 ou 2
        var _linha = "A";
        if (_indice_linha == 1) _linha = "B";
        else if (_indice_linha == 2) _linha = "C";
        
        var _coordenada = _linha + string(_coluna); // Ex: B2, A4, etc.
        
        //Descobrir o binário com base no item_id do Creation Code
        var _binario_texto = "00000000"; // Padrão de segurança
        
        // Exemplo de associação baseada no item_id configurado no Creation Code
        switch (room) {
            case rm_1_terra:
                if (item_id == 1) _binario_texto = "01000011 01000001";
                else if (item_id == 2) _binario_texto = "01001101 01000111";
                else _binario_texto = "11000101 11000101";
                break;
                
            case rm_2_bunker:
                // Podes ajustar os IDs para o bunker conforme necessário
                _binario_texto = "11000101 11000101 11000101";
                break;
                
            case rm_3_air:
                if (item_id == 1) _binario_texto = "00110110 01000010";
                else _binario_texto = "00111000 01000010";
                break;
                
            case rm_4_agua:
                _binario_texto = "00110011 * 00110010";
                break;
        }
        
        // Escreve no formato exato pedido: COORDENADA : TEXTO BINARIO
        file_text_write_string(_arquivo, _coordenada + " : " + _binario_texto);
        file_text_writeln(_arquivo);
    }
    
    file_text_close(_arquivo);
}
	
	//o resto do codigo esta rodando dentro do room start do objeto camera