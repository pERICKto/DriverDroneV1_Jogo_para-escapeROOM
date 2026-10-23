

// EVENTO: Other > Room Start

switch (room) {
    
    case rm_1_terra:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        break;
        
    //configuracoes fase 2 bunker
    case rm_2_bunker:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        
        //

				if (!instance_exists(obj_CENTRAL_BUNKER)) {
            instance_create_layer(500, 500, "Instances", obj_CENTRAL_BUNKER);
        }

		if (!instance_exists(obj_batery)) {
            instance_create_layer(0, 0, "Instances", obj_batery);
        }

        break;
        
    //configuracoes fase 3 coleta de ar
    case rm_3_air:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        break;
        
    //configuracoes fase 4 da [agua
    case rm_4_agua:
        if (!instance_exists(obj_grid_maker)) {
            instance_create_layer(0, 0, "Instances", obj_grid_maker);
        }
        break;

    //configuracoes sala de vitoria!!
    case rm_victory:
        if (instance_exists(obj_grid_maker)) {
            instance_destroy(obj_grid_maker);
        }
        break;
}