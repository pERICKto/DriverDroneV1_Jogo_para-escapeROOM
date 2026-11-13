#region grid maker boladona
var w = 1; // espessura da grid
draw_set_colour(c_orange); // cor da grid
draw_set_alpha(0.2);

for (var i = 0; i < room_height; i += 60){
    draw_line_width(0, i, room_width, i, w);
}
for (var i = 0; i < room_width; i += 60){
    draw_line_width(i, 0, i, room_height, w);
}
draw_set_alpha(1);
#endregion
#region //radar tatico (resto da hud)
if (instance_exists(obj_player)) {
    var px = obj_player.x;
    var py = obj_player.y;

    draw_set_colour(c_green);
    draw_set_circle_precision(60);

    //>bola ezterna (Raio 230)
    draw_set_alpha(0.5);
    draw_circle(px, py, 230, true);

    // círculos concêntricos internos
    draw_set_alpha(0.3);
    draw_circle(px, py, 130, true); //intermediário
    draw_circle(px, py, 60, true);  //interno
    draw_circle(px, py, 15, true);  //central

    //>>tracinhos na bola
    draw_set_alpha(0.4);
    var num_ticks = 24; 
    var outer_radius = 230;
    
    for (var t = 0; t < num_ticks; t++) {
        var ang = (t / num_ticks) * 360;
        var len_tick = (t % 6 == 0) ? 10 : 5; 
        var tick_width = (t % 6 == 0) ? 2 : 1; 
        
        var x1 = px + lengthdir_x(outer_radius, ang);
        var y1 = py + lengthdir_y(outer_radius, ang);
        var x2 = px + lengthdir_x(outer_radius - len_tick, ang);
        var y2 = py + lengthdir_y(outer_radius - len_tick, ang);
        
        draw_line_width(x1, y1, x2, y2, tick_width);
    }

    //>>>linhas verticais crescentes
    draw_set_alpha(0.4);
    var bar_offsets = [45, 90, 140]; // Distâncias horizontais a partir do centro
    var bar_heights = [20, 50, 85];  // Alturas crescentes das barras verticais
    
    // Desenha simetricamente para a direita e para a esquerda do jogador
    for (var i = 0; i < array_length(bar_offsets); i++) {
        var bx = bar_offsets[i];
        var bh = bar_heights[i];
        
        // Lado Direito
        draw_line_width(px + bx, py - (bh / 2), px + bx, py + (bh / 2), 1);
        
        // Lado Esquerdo
        draw_line_width(px - bx, py - (bh / 2), px - bx, py + (bh / 2), 1);
    }
}
#endregion

// Restaura os padrões gráficos do GameMaker
draw_set_alpha(1.0);
draw_set_circle_precision(20);