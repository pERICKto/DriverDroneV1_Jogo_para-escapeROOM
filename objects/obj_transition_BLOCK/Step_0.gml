if (place_meeting(x,y,obj_player) && !instance_exists(obj_transition))
{
	global.trocou_de_sala = true;
	persistent = true
	var _transition = instance_create_depth(0,0,-666, obj_transition)		//cria transicao em  acima de tudo!
	_transition.targetROOM_x = targetROOM_x;
	_transition.targetROOM_y = targetROOM_y;
	_transition.target_ROOM = target_ROOM;

	instance_destroy();
}