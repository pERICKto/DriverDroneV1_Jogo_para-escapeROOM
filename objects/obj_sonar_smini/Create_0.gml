lista_paredes = ds_list_create();
lista_pontos  = ds_list_create();
lista_fade    = ds_list_create();

cor_sonar = c_aqua;

raio_minimo = 10;
raio_maximo = 60;
draw_set_alpha(0.5)
radius = raio_minimo;

direcao_resp = 1;     // 1 = expandindo, -1 = encolhendo
velocidade_resp = 0.48;	