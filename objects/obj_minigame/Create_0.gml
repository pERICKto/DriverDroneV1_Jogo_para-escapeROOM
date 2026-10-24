// Onda alvo (gerada aleatoriamente)
alvo_amplitude = irandom_range(10, 70);
alvo_frequencia = random_range(0.02, 0.08);
alvo_velocidade = random_range(0.5, 4);

// Onda do player (começa em valores neutros)
player_amplitude = 30;
player_frequencia = 0.05;
player_velocidade = 0;


alvo_fase = 0;
player_fase = 0;
tolerancia = 1.54; // margem de erro aceitável pra "encaixar"

//intro 
intro = true;
texto_intro = scribble("syncing with bunker...          [delay][c_green]ok[/c]\nadjusting proper sonar...       [delay][c_green]ok[/c]\nsyncing frequency...            [delay][c_red]FAIL[/c]\n\n[c_yellow]switching to manual sync... [delay]\n\n[blink]starting manual sync...   [delay,1300]");
typist_intro = scribble_typist();
typist_intro.in(0.5, 0);

//confirmação pos minigame
espera = false;
destino = -1;

texto_final_t = scribble("manual sync...    [delay][c_green]complete[/c]\n\ndecoding...        [delay][delay][c_green]complete[/c]\n\nsending... [delay]");
typist_final_t = scribble_typist();
typist_final_t.in(0.5, 0);

texto_final_a = scribble("manual sync...    [delay][c_green]complete[/c]\n\ndecoding...        [delay][delay][c_green]complete[/c]\n\nsending... [delay]");
typist_final_a = scribble_typist();
typist_final_a.in(0.5, 0);

texto_final_w = scribble("manual sync...    [delay][c_green]complete[/c]\n\ndecoding...        [delay][delay][c_green]complete[/c]\n\nsending... [delay]");
typist_final_w = scribble_typist();
typist_final_w.in(0.5, 0);

//msg dos binario
typist_binario = scribble_typist();
texto_binario = undefined;
binario_cache = "";




