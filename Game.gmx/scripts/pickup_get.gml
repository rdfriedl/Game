var _id = room_get_name(room) + '_' + string(argument0);

if(ds_exists(global.pickups,ds_type_map)){
    if(ds_map_exists(global.pickups,_id)){
        return ds_map_find_value(global.pickups,_id);
    }
}
return false;
