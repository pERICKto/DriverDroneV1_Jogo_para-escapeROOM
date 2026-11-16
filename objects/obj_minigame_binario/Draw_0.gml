/// @description Draw temporário apenas para testar a lógica no Play
draw_set_color(c_lime);

for (var i = 0; i < 32; i++) {
    var _col = i mod 8;
    var _lin = i div 8;
    var _x = 100 + (_col * 30);
    var _y = 100 + (_lin * 30);
    
    // Desenha literalmente o número 0 ou 1 na tela
    draw_text(_x, _y, string(leds[i]));
    
    // Marca onde o cursor está
    if (i == cursor) {
        draw_rectangle(_x - 5, _y - 5, _x + 15, _y + 20, true);
    }
}

// Mostra no canto se você acertou o código
if (minigame_concluido) {
    draw_text(100, 260, "SUCESSO! AMOSTRA " + string(amostra_liberada) + " LIBERADA!");
}

draw_set_color(c_white);