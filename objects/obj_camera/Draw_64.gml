draw_set_colour(cor_sonar_raio_hud);
draw_text(600,32,"distancia total"+ string(global.distancia_percorrida/5));
draw_text(32,450,"precision radius"+ string(pcr));

#region	//sistema do mini monitor hud
// 1. Posição em pixels do visor escura do MONITOR no seu sprite da HUD (ajuste estes valores)
var _mon_x1 = 290; // Borda esquerda da tela do monitor
var _mon_y1 = 510; // Borda superior da tela do monitor
var _mon_x2 = 510; // Borda direita da tela do monitor
var _mon_y2 = 580; // Borda inferior da tela do monitor
// Descobrindo o meio exato do monitor para saber onde a curva é maior
var _mon_center_x = (_mon_x1 + _mon_x2) / 2;
var _mon_center_y = (_mon_y1 + _mon_y2) / 2;

// 2. Calcula a porcentagem onde o jogador está na sala (de 0.0 a 1.0)
var _pct_x = clamp(obj_player.x / room_width, 0, 1);
var _pct_y = clamp(obj_player.y / room_height, 0, 1);

// 3. Converte essa porcentagem para a posição exata dentro do visor da HUD
var _line_x = _mon_x1 + (_pct_x * (_mon_x2 - _mon_x1));
var _line_y = _mon_y1 + (_pct_y * (_mon_y2 - _mon_y1));

draw_set_color(c_lime); 
draw_set_alpha(0.5);   

var _segments = 12;      // Em quantos pedaços a linha vai ser cortada
var _curve_max = 6;      // O quão "gorda" é a curvatura (mude isso para curvar mais ou menos!)

// Desenhando a Linha Horizontal Curva
var _norm_y = (_line_y - _mon_center_y) / ((_mon_y2 - _mon_y1) / 2);
var _prev_x = _mon_x1;
var _prev_y = _line_y;

for (var i = 1; i <= _segments; i++) {
    var _t = i / _segments;
    var _curr_x = lerp(_mon_x1, _mon_x2, _t);
    var _parabola = 1 - 4 * sqr(_t - 0.5); 
    var _curr_y = _line_y + (_norm_y * _curve_max * _parabola);
    
    draw_line(_prev_x, _prev_y, _curr_x, _curr_y);
    _prev_x = _curr_x;
    _prev_y = _curr_y;
}

// Desenhando a Linha Vertical Curva
var _norm_x = (_line_x - _mon_center_x) / ((_mon_x2 - _mon_x1) / 2);
var _prev_x = _line_x;
var _prev_y = _mon_y1;

for (var i = 1; i <= _segments; i++) {
    var _t = i / _segments;
    var _curr_y = lerp(_mon_y1, _mon_y2, _t);
    var _parabola = 1 - 4 * sqr(_t - 0.5);
    var _curr_x = _line_x + (_norm_x * _curve_max * _parabola);
    
    draw_line(_prev_x, _prev_y, _curr_x, _curr_y);
    _prev_x = _curr_x;
    _prev_y = _curr_y;
}
// 5. Reseta a cor e o alfa
draw_set_color(c_white);
draw_set_alpha(1.0);
#endregion

//desenho da bateria
//tem q ser aqui pq parece q o game maker coloca desenho por ordem de codigo e instanciacriada!
if(instance_exists(obj_batery)){
if (obj_batery.batery_estado = 1) {
    draw_sprite(spr_batery_1, 0, 71, 514);
}

if (obj_batery.batery_estado = 2) {
    draw_sprite(spr_batery_1, 1, 71, 514);
	
}
if (obj_batery.batery_estado = 3) {
    draw_sprite(spr_batery_1, 2, 71, 514);
}

if (obj_batery.batery_estado = 4) {
    draw_sprite(spr_batery_1, 3, 71, 514);
}

draw_text(400,64,global.bateria_atual )
}