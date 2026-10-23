//marcar persist pq o objeto pode ser destruido antes da trnsicao de cenario ser concuira (:0)
if (global.valid_terra == "usado")
{
    instance_destroy();
}
else
{
    targetROOM_x = 930; 
    targetROOM_y = 755;
    target_ROOM = rm_1_terra; // selecao de sala
}