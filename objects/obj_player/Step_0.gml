// BUSCA O ARDUINO (SLOTS 4 A 11)
var pad = -1;
for (var i = 4; i < 12; i++) {
    if (gamepad_is_connected(i)) {
        pad = i;
        break;
    }
}

// Direcionais absolutos (Teclado e Controle)
var right_key = keyboard_check(vk_right) || (pad != -1 && gamepad_button_check(pad, 3));
var left_key  = keyboard_check(vk_left)  || (pad != -1 && gamepad_button_check(pad, 1));
var up_key    = keyboard_check(vk_up)    || (pad != -1 && gamepad_button_check(pad, 0));
var down_key  = keyboard_check(vk_down)  || (pad != -1 && gamepad_button_check(pad, 2));

var sonar_key = keyboard_check_pressed(vk_space) || (pad != -1 && gamepad_button_check_pressed(pad, 4));

if (global.intro_pronta)
{
    if (!global.lendo)
    {
        // Cálculo do movimento direcional (Eixos X e Y)
        var hmov = right_key - left_key;
        var vmov = down_key - up_key;

        xspd = hmov * spd;
        yspd = vmov * spd;

        // Movimento Horizontal + Colisão
        x += xspd;
        if (place_meeting(x, y, obj_wall))
        {
            x -= xspd;
            xspd = 0;
        }

        // Movimento Vertical + Colisão
        y += yspd;
        if (place_meeting(x, y, obj_wall))
        {
            y -= yspd;
            yspd = 0;
        }
        
        // Fazer barulho quando anda e contabiliza distância para a HUD
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

        if ((xspd != 0 && room == rm_1_terra) || (yspd != 0 && room == rm_1_terra)) {
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
            audio_play_sound(motion_detector_loop1, 1, false, 0.8);
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
if(room !=rm_2_bunker && criou_sonar_respirante=false){
instance_create_layer(x, y, "Instances", obj_sonar_smini);
criou_sonar_respirante=true
}


if(room = rm_2_bunker){
instance_destroy(obj_sonar_smini)
 criou_sonar_respirante = false;
}

if (instance_exists(obj_sonar_smini)) {
    obj_sonar_smini.x = x;
    obj_sonar_smini.y = y;
}
