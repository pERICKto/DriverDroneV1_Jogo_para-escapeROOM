// Só desenha o círculo se a onda ainda estiver a expandir
if (radius < max_radius) {
    draw_set_color(cor_sonar);
    
    // Calcula o alpha (transparência da onda) baseado na percentagem percorrida do raio
    var _alpha = 1 - (radius / max_radius);
    draw_set_alpha(_alpha);
    
    // Desenha o círculo principal
    draw_circle(x, y, radius, true);
    
    // Imprime um segundo círculo com 1px de diferença para dar espessura à linha
    draw_circle(x, y, radius + 1, true);
    
    // Reseta as propriedades de desenho para outros objetos posteriores
    draw_set_alpha(1);
    draw_set_colour(c_white);
}