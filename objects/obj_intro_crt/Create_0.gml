//este objeto faz a intro horizontal estilo frames de televisao CRT
// Tamanho da tela
gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

// Variáveis do feixe de varredura (o "pixel" atual)
scan_x = 0;
scan_y = 0;

// Configurações do efeito
scan_speed = 4500;       // Velocidade da varredura (pixels por frame)
line_height = 8;       // Grossura de cada linha da TV

// Controle da Surface e Animação
surf_intro = -1;
intro_terminou = false;

global.intro_pronta = false;
