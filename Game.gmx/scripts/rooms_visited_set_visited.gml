if(ds_exists(global.rooms_visited,ds_type_map)){
    if(ds_map_exists(global.rooms_visited,room_get_name(argument0))){
        ds_map_replace(global.rooms_visited,room_get_name(argument0),argument1);
    }
    else{
        ds_map_add(global.rooms_visited,room_get_name(argument0),argument1);
    }
}
