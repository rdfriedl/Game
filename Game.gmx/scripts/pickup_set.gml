var _id = room_get_name(room) + '_' + string(argument0);

if(ds_exists(global.pickups,ds_type_map)){
    if(ds_map_exists(global.pickups,_id)){
        ds_map_replace(global.pickups,_id,argument1);
    }
    else{
        ds_map_add(global.pickups,_id,argument1);
    }
}
