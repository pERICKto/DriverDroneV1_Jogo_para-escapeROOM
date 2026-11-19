if (!variable_instance_exists(id, "aguardando_leitura_erro")) {
    aguardando_leitura_erro = false;
    texto_erro_iniciado = false;
}

if (!place_meeting(x,y,obj_player))
{
    portinha = false;
    aguardando_leitura_erro = false;
    texto_erro_iniciado = false;
}

if place_meeting(x, y, obj_player)
{
    if (!portinha)
    {
        audio_play_sound(keypad_open_panel_01,1,false,1);
        portinha = true;
    }
    // sistema de regarga de pilha do bunker!!
    if (global.bateria_atual <= 4000) {
        recarga += 10;
    }
    
    // --- TERRA (independente) ---
    if (global.terra == global.valid_terra) 
    {    
        instance_destroy(inst_1T);
        if (scan == false) 
        {
            if (estado_amostra == 0) 
            {
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1;
            }
            else if (estado_amostra == 1) 
            {
                if (!audio_is_playing(sfx_amostra_bunker) && !global.lendo) // espera o texto terminal acaabar
                {
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    global.valid += 1;
                    global.terra = "";
                    global.valid_terra = "usado";
                    scan = false;
                    estado_amostra = 0;
                }
            }
        }
    }
    else if (global.terra != global.valid_terra && global.terra != "")
    {
        if (!aguardando_leitura_erro)
        {
            if (!audio_is_playing(sfx_Alarm5)) { audio_play_sound(sfx_Alarm5, 1, false); }
            aguardando_leitura_erro = true;
            texto_erro_iniciado = false;
        }
        else
        {
            // Espera o obj_terminal começar a digitar o erro (global.lendo == true)
            if (global.lendo) {
                texto_erro_iniciado = true;
            }
            // Só limpa global.terra DEPOIS que o terminal começou E terminou de digitar tudo
            else if (texto_erro_iniciado && !global.lendo) {
                global.terra = "";
                aguardando_leitura_erro = false;
                texto_erro_iniciado = false;
            }
        }
    }

    // --- AR (independente) ---
    if (global.air == global.valid_air)
    {    
        instance_destroy(inst_3A);
        if (scan == false) 
        {
            if (estado_amostra == 0) 
            {
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1;
            }
            else if (estado_amostra == 1) 
            {
                if (!audio_is_playing(sfx_amostra_bunker)) 
                {
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    global.valid += 1;
                    global.air = "";
                    global.valid_air = "usado";
                    scan = false;
                    estado_amostra = 0;
                }
            }
        }
    }
    else if (global.air != global.valid_air && global.air != "")
    {
        if (!aguardando_leitura_erro)
        {
            if (!audio_is_playing(sfx_Alarm5)) { audio_play_sound(sfx_Alarm5, 1, false); }
            aguardando_leitura_erro = true;
            texto_erro_iniciado = false;
        }
        else
        {
            if (global.lendo) {
                texto_erro_iniciado = true;
            }
            else if (texto_erro_iniciado && !global.lendo) {
                global.air = "";
                aguardando_leitura_erro = false;
                texto_erro_iniciado = false;
            }
        }
    }

    // --- ÁGUA (independente) ---
    if (global.water == global.valid_water)
    {    
        instance_destroy(inst_4W);
        if (scan == false) 
        {
            if (estado_amostra == 0) 
            {
                audio_play_sound(sfx_amostra_bunker, 2, false);
                estado_amostra = 1;
            }
            else if (estado_amostra == 1) 
            {
                if (!audio_is_playing(sfx_amostra_bunker)) 
                {
                    audio_play_sound(sfx_spawBUNKER_ou_desceramostra, 3, false);
                    scan = true;
                    global.valid += 1;
                    global.water = "";
                    global.valid_water = "usado";
                    scan = false;
                    estado_amostra = 0;
                }
            }
        }
    }
    else if (global.water != global.valid_water && global.water != "")
    {
        if (!aguardando_leitura_erro)
        {
            if (!audio_is_playing(sfx_Alarm5)) { audio_play_sound(sfx_Alarm5, 1, false); }
            aguardando_leitura_erro = true;
            texto_erro_iniciado = false;
        }
        else
        {
            if (global.lendo) {
                texto_erro_iniciado = true;
            }
            else if (texto_erro_iniciado && !global.lendo) {
                global.water = "";
                aguardando_leitura_erro = false;
                texto_erro_iniciado = false;
            }
        }
    }
}

if (global.valid >= 3 && !global.sequencia_final && place_meeting(x, y, obj_player) && !global.lendo)
{
    global.sequencia_final = true;
}

if (global.sequencia_final && !jogo_finalizado && typist_texto_final.get_state() == 1.0)
{
    jogo_finalizado = true;

    audio_stop_all();
    audio_play_sound(distorted_console_login_jingle, 5, false);

    instance_deactivate_all();
    instance_create_layer(0, 0, "Instances", Obj_victory);

    var _pasta = environment_get_variable("USERPROFILE") + "\\Downloads\\";
    var _caminho = _pasta + "jogo_finalizado.txt";
    var _arquivo = file_text_open_write(_caminho);
    if (_arquivo != -1) { file_text_close(_arquivo); }
}