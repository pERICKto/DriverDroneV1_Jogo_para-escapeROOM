/// @description Draw GUI no padrão do amigo usando Scribble e global.terra

if (intro)
{
    texto_intro.draw(100, 100, typist_intro);
}
else
{
    if (!espera)
    {


        // --- ÁREA DOS LEDS (Placeholder simples de depuração até alinharmos o visual final) ---
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

            // Desenha o LED (Verde se ligado = 1, Cinza escuro se desligado = 0)
            draw_set_color(leds[i] ? c_lime : c_dkgray);
            draw_circle(_x, _y, 12, false);

            // Destaca o cursor atual em amarelo
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
        var _string = "";

        if (destino == rm_1_terra)
        {
            if (typist_final_t.get_state() < 1)
            {
                texto_final_t.draw(100, 80, typist_final_t);
            }
            else
            {
                if (global.terra == 1)
                {
                    _string = "01000011 01000001 : [c_green]00110110 00110000 %[/c]\n01001101 01000111 : [c_green]00110001 00110101 %[/c]\n01001011 : [c_green]00110000 00110101 %[/c]\n01001000 : [c_green]00110001 00110010 %[/c]\n01000001 01001100 : [c_green]00110000 00111000 %[/c]\n\n[c_green]Analise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
                }
                else if (global.terra == 2)
                {
                    _string = "01001110 01000001 : [c_green]00110001 00110000 %[/c]\n01001111 : [c_green]00110110 00110000 %[/c]\n01000011 01000001 : [c_green]00110000 00110110 %[/c]\n01001101 01000111 : [c_green]00110000 00110100 %[/c]\n01010011 01001001 : [c_green]00110010 00110000 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
                }
                else if (global.terra == 3)
                {
                    _string = "01000011 01000001 : [c_green]00110000 00110001 %[/c]\n01001111 : [c_green]00110100 00110000 %[/c]\n01000011 : [c_green]01000110 00110110 %[/c]\n01001000 : [c_green]00110000 00111001 %[/c]\n01001110 : [c_green]00110000 00110100 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
                }

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
}