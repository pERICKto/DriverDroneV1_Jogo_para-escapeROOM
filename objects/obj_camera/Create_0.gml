
target_ = obj_player;
width_ = camera_get_view_width(view_camera[0])
height_ = camera_get_view_height(view_camera[0]);
pcr = 0;
cor_sonar_raio_hud = c_green
pcr = clamp(pcr,0,100);
consumo_bateria = pcr * 1.5
global.bateria_atual = 4000;
global.player_is_moving = false;
global.trocou_de_sala = false;
distancia_moving = 0;

lista_fade = ds_list_create();

// Desativa a ação de fechar a janela (desativa o 'X' e o Alt+F4)
window_command_set_active(window_command_close, false);