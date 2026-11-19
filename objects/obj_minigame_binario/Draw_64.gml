/// @description Draw GUI do terminal binário (sem spoilers das respostas do bunker)

if (intro)
{
    texto_intro.draw(100, 100, typist_intro);
}
else
{
    if (!espera)
    {
        // --- ÁREA DOS LEDS (Placeholder temporário para visualização da matriz 8x4) ---
        var _inicio_x = 180;
        var _inicio_y = 140;
        var _espaco_x = 45;
        var _espaco_y = 45;

        for (var i = 0; i < 32; i++)
        {
            var _col = i mod 8;
            var _lin = i div 8;
            var _x = _inicio_x + (_col * _espaco_x);
            var _y = _inicio_y + (_lin * _espaco_y);

            draw_set_color(leds[i] ? c_lime : c_dkgray);
            draw_circle(_x, _y, 12, false);

            if (i == cursor)
            {
                draw_set_color(c_yellow);
                draw_rectangle(_x - 18, _y - 18, _x + 18, _y + 18, true);
            }
        }
        draw_set_color(c_white);
    }
    else
    {
        if (typist_final_t.get_state() < 1)
        {
            texto_final_t.draw(100, 80, typist_final_t);
        }
        else
        {
            var _string = "[c_green]SEQUENCIA IDENTIFICADA:\n" + sequencia_capturada + "\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";

            if (_string != binario_cache)
            {
                binario_cache = _string;
                texto_binario = scribble(_string);
                typist_binario.in(0.45, 0);
            }

            texto_binario.draw(100, 80, typist_binario);
        }
    }
}