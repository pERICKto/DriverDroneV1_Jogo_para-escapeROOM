lista_paredes = ds_list_create();
lista_pontos  = ds_list_create();
lista_fade    = ds_list_create();
cor_sonar = c_blue;
convert_radius = obj_batery.batery_estado; 
radius = 10;
max_radius = convert_radius * 5;      
wave_width = 8;         
alpha = 0.2;

lista_paredes = ds_list_create();
lista_pontos = ds_list_create();
collision_circle_list(x, y, max_radius, obj_wall, false, true, lista_paredes, false);
collision_circle_list(x, y, max_radius, obj_ponto, false, true, lista_pontos, false);

n_paredes = ds_list_size(lista_paredes);
dist_paredes = array_create(n_paredes);
for (var i = 0; i < n_paredes; i++) {
    dist_paredes[i] = point_distance(x, y, lista_paredes[| i].x, lista_paredes[| i].y);
}

n_pontos = ds_list_size(lista_pontos);
dist_pontos = array_create(n_pontos);
// Removida a verificação de pontos_visíveis. 
for (var i = 0; i < n_pontos; i++) {
    var _p = lista_pontos[| i];
    dist_pontos[i] = point_distance(x, y, _p.x, _p.y);
}