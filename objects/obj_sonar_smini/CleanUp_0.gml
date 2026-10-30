// Destrói todas as listas da memória quando o objeto desaparece
if (variable_instance_exists(id, "lista_paredes") && ds_exists(lista_paredes, ds_type_list)) {
    ds_list_destroy(lista_paredes);
}

if (variable_instance_exists(id, "lista_pontos") && ds_exists(lista_pontos, ds_type_list)) {
    ds_list_destroy(lista_pontos);
}

if (variable_instance_exists(id, "lista_fade") && ds_exists(lista_fade, ds_type_list)) {
    ds_list_destroy(lista_fade);
}