//marcar persist pq o objeto pode ser destruido antes da trnsicao de cenario ser concuira (:0)
if (global.valid_water == "usado")
{
    instance_destroy();
}
else
{
targetROOM_x = 672; 
targetROOM_y = 94;
target_ROOM = rm_4_agua; // selecao de sala
}