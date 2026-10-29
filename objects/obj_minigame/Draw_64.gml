if (intro)
{
    texto_intro.draw(100, 100, typist_intro);
}
else
{
    if (!espera)
    {
        //hud
        draw_sprite(spr_hud_minimage,0,-20,3);

        //minigame
        var centro_y = 150;
        var largura = room_width;
        var passo = 2;
        var y_alvo_ant = centro_y + alvo_amplitude * sin(alvo_frequencia * 0 + alvo_fase);
        var y_player_ant = centro_y + player_amplitude * sin(player_frequencia * 0 + player_fase);
        for (var i = passo; i < largura; i += passo) 
        {
            var y_alvo = centro_y + alvo_amplitude * sin(alvo_frequencia * i + alvo_fase);
            var y_player = centro_y + player_amplitude * sin(player_frequencia * i + player_fase);

            draw_line_color(i - passo, y_alvo_ant, i, y_alvo, c_red, c_red);
            draw_line_color(i - passo, y_player_ant, i, y_player, c_lime, c_lime);

            y_alvo_ant = y_alvo;
            y_player_ant = y_player;
        }
        //knobs
    //knobs
        var _amp_state  = knob_state(player_amplitude, 0, 80);      
        var _freq_state = knob_state(player_frequencia, 0.01, 0.10);
        var _vel_state  = knob_state(player_velocidade, 0, 5);

        draw_sprite(spr_knob, _amp_state,  135, 544.5);
        draw_sprite(spr_knob, _vel_state, 383, 545);
        draw_sprite(spr_knob, _freq_state,  630, 544);

    }
else
{
    sprite_delete(spr_hud_minimage);
    var _string;

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
                _string = "01001110 01000001 : [c_green]00110001 00110000 %[/c]\n01001111 :  [c_green]00110110 00110000 %[/c]\n01000011 01000001 : [c_green]00110000 00110110 %[/c]\n01001101 01000111  :  [c_green]00110000 00110100 %[/c]\n01010011 01001001 :  [c_green]00110010 00110000 %[/c]\n01010011 01001001 :  [c_green]00110010 00110000 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.terra == 3)
            {
                _string = "01000011 01000001 : [c_green]00110000 00110001 %[/c]\n01001111 : [c_green]00110100 00110000 %[/c]\n01000011 : [c_green]00110100 00110110 %[/c]\n01001000  : [c_green]00110000 00111001 %[/c]\n01001110 : [c_green]00110000 00110100 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.terra == 4)
            {
                _string = "01000001 01001100 : [c_green]00110000 00111000 %[/c]\n01001111 : [c_green]00110100 00110110 %[/c]\n01001011 : [c_green]00110000 00110101 %[/c]\n01010011 01001001 : [c_green]01010011 01001001 %[/c]\n01001110 01000001 : [c_green]00110000 00110011 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.terra == 5)
            {
                _string = "01001111 : [c_green]00110100 00111000 %[/c]\n01000011 : [c_green]00110001 00110010 %[/c]\n01000011 01000001 : [c_green]00110100 00110000 %[/c]\n\nAnalise finalizada... [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.terra == 6)
            {
                _string = "[c_green]smelly organic material... \nbetter leave it alone";
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
    else if (destino == rm_3_air)
    {
        if (typist_final_a.get_state() < 1)
        {
            texto_final_a.draw(100, 80, typist_final_a);
        }
        else
        {
            if (global.air == 1)
            {
                _string = "[c_green]#00110110 01000010 00110010 01000011 00111001 00110001 00100000[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar "; //coraçao roxo
            }
            else if (global.air == 2)
            {
                _string = "[c_green]#00111000 01000010 00110011 01000001 00110010 01000110 00100000[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"; // pinheiro com radiação
            }
            else if (global.air == 3)
            {
                _string = "[c_green]#01000001 00110100 00110101 01000011 00110011 00110010[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"; //plantas rasteiras 
            }
            else if (global.air == 4)
            {
                _string = "[c_green]#00110011 01000110 00110101 01000010 00110011 01000001 00100000 [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"; //espada de são jorge
            }
            else if (global.air == 5)
            {
                _string = "[c_green]#00110010 01100010 00110010 01100010 00110010 00111000 [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"; // planta seca e morta
			}
			else if (global.air == 6)
            {
                _string = "[c_green]#0110001 00110111 00110000 01100101 00110000 00110000 [delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar"; // amontoado de adubo
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
    else if (destino == rm_4_agua)
    {
        if (typist_final_w.get_state() < 1)
        {
            texto_final_w.draw(100, 80, typist_final_w);
        }
        else
        {
            if (global.water == 1)
            {// 3 * 2 / 1
                _string = "[c_green]00110011 * 00110010\n ---------------- \n     00110001[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.water == 2)
            {
                _string = "[c_green]00110010 * 00110101\n ---------------- \n     00110001[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.water == 3)
            {
                _string = "[c_green]00110010 * 00110101\n ---------------- \n     00110001[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.water == 4)
            {
                _string = "[c_green]00110010 * 00110001 00110000\n ---------------- \n     00110010[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.water == 5)
            {
                _string = "[c_green]00110010 * 00110001 00110000\n ---------------- \n     00110010[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
            else if (global.water == 6)
            {
                _string = "[c_green]just some debris[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
            }
			else if (global.water == 7)
			{
				_string = "[c_green]a bunch of rock and metal[delay]\n\n[c_yellow][blink]sonar = coletar \n\noutro = largar";
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