//marcar persist pq o objeto pode ser destruido antes da trnsicao de cenario ser concuira (:0)
if (global.valid_terra == "usado")
{
    instance_destroy();
}
else
{
    targetROOM_x = 1650; 
    targetROOM_y = 1075;
    target_ROOM = rm_1_terra; // selecao de sala
}