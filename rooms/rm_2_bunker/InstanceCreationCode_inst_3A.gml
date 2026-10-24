//marcar persist pq o objeto pode ser destruido antes da trnsicao de cenario ser concuira (:0)
if (global.valid_air == "usado")
{
    instance_destroy();
}
else
{
targetROOM_x = 45; 
targetROOM_y = 570;
target_ROOM = rm_3_air; // selecao de sala
}