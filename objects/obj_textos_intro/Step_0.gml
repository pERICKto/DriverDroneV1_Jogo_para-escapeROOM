 if (keyboard_lastkey != -1)
{
   if (keyboard_lastkey == sequencia[indice_atual])
    {
        indice_atual++;
       if (indice_atual >= array_length(sequencia))
        {
            // sequência completa!
            audio_play_sound(distorted_welcome_jingle, 2, false);
            esperando_audio = true; // liga a flag, não checa nada agora
       }
    }
   else
   {
        indice_atual = (keyboard_lastkey == sequencia[0]) ? 1 : 0;
   }
    keyboard_lastkey = -1;
}
if (esperando_audio && !audio_is_playing(distorted_welcome_jingle))
{
    esperando_audio = false;
    room_goto(rm_2_bunker);
	audio_play_sound(sfx_spawBUNKER_ou_desceramostra,5,false);
}
