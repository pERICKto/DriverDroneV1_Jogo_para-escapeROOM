// BUSCA O ARDUINO (SLOTS 4 A 11)
var pad = -1;
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
        break;
    }
}


right_key = keyboard_check_pressed(vk_right) || (pad != -1 && gamepad_button_check_pressed(pad, 3));
left_key  = keyboard_check_pressed(vk_left)  || (pad != -1 && gamepad_button_check_pressed(pad, 1));

var up_check   = keyboard_check(vk_up)   || (pad != -1 && gamepad_button_check(pad, 0));
var down_check = keyboard_check(vk_down) || (pad != -1 && gamepad_button_check(pad, 2));

var sonar_key = keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4));

if (global.intro_pronta)
{
    if (!global.lendo)
    {
        // Girar o sprite 90 graus a cada aperto
        if (right_key)
        {
            image_angle -= 90; //direita
        }
        if (left_key)
        {
            image_angle += 90; //esquerda
        }

        // Andar pra frente/trás na direção que o sprite tA olhando
        mov = (up_check - down_check);
        xspd = lengthdir_x(spd, image_angle) * mov;
        yspd = lengthdir_y(spd, image_angle) * mov;

        // Andar
        x += xspd;
        y += yspd;
		
// Colisão rústica
if (place_meeting(x, y + 9, obj_wall))
{
    y -= yspd; // Cancela o movimento
    yspd = 0;
}
if (place_meeting(x - 9, y, obj_wall))
{
    x -= xspd; // Cancela o movimento
    xspd = 0; 
}

		//far barulho quando anda e contabiliza distancia para a HUD
if (xspd != 0 || yspd != 0) {
    global.player_is_moving = true;
    global.distancia_percorrida += point_distance(0, 0, xspd, yspd);
    
    if (!audio_is_playing(sfx_39__Propeller_Noise)) {
        audio_play_sound(sfx_39__Propeller_Noise, 1, false);
    }
} else {
    global.player_is_moving = false;
    audio_stop_sound(sfx_39__Propeller_Noise);
}

if (xspd != 0 &&room == rm_1_terra || yspd != 0 &&room == rm_1_terra) {
    global.player_is_moving = true;
    
    if (!audio_is_playing(sfx_barulho_terra_do_youtube)) {
        audio_play_sound(sfx_barulho_terra_do_youtube, 2, false);
    }
} else {
    global.player_is_moving = false;
    audio_stop_sound(sfx_barulho_terra_do_youtube);
}

        // Ativação do Sonar
        if (sonar_key)
        {
			audio_play_sound(motion_detector_loop1,1,false,0.8);
            raio = true;
            instance_create_layer(x, y, "Instances", obj_Sonar_player);
        }
    }
}


// Verificação do Bunker
if (place_meeting(x, y, obj_CENTRAL_BUNKER))
{
	visible = false;
    bunker = true;
}
else
{
	visible = true;
    bunker = false;
}