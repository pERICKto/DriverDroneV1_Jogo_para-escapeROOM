if (room == rm_binario)
{
    instance_deactivate_object(obj_player);
	instance_deactivate_object(obj_batery);
    instance_deactivate_object(obj_HUD_inferior);
	draw_self();
	instance_deactivate_object(obj_Sonar_player);
	instance_deactivate_object(obj_camera);
		audio_play_sound(distorted_audio_transmission,10,false);
	audio_stop_sound(sfx_39__Propeller_Noise);
	audio_stop_sound(sfx_barulho_terra_do_youtube);
	audio_stop_sound(strong_wind__long);
}