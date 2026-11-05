//marcar persist pq o objeto pode ser destruido antes da trnsicao de cenario ser concuira (:0)
if (global.valid_air == "usado")
{
    instance_destroy();
}
else
{
targetROOM_x = 50; 
targetROOM_y = 830;
target_ROOM = rm_3_air; // selecao de sala
}