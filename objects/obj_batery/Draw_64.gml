//if (fallout_gui)==true{
//draw_sprite(spr_HUD_placeholder_duh, 0,0,3); //3 pq tela tem 603pixels pra nao ter mixel
////hud util tem 125 pixels
//}
	
if (batery_estado = 1) {
    draw_sprite(spr_batery_1, 0, 71, 514);
}

if (batery_estado = 2) {
    draw_sprite(spr_batery_1, 1, 71, 514);
	
}
if (batery_estado = 3) {
    draw_sprite(spr_batery_1, 2, 71, 514);
}

if (batery_estado = 4) {
    draw_sprite(spr_batery_1, 3, 71, 514);
}

if (batery_estado = 5) {
    draw_sprite(spr_batery_1, 4, 71, 514);
}


//draw_text(400,64,global.bateria_atual )
