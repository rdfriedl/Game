//open the ini
ini_open('saves.ini');

var ini_name = argument0;
var save_lives = argument1;

//write power grids
var list = ds_list_create();

var first = ds_map_find_first(global.power_grids);
var size = ds_map_size(global.power_grids);
for(var i = 0; i < size; i +=1){
    ds_list_add(list,first);
    
    ini_write_string(ini_name,'power_grid_'+string(first),ds_map_write(ds_map_find_value(global.power_grids,first)))
    
    first = ds_map_find_next(global.power_grids,first);
}

ini_write_string(ini_name,'power_grids',ds_list_write(list));

ds_list_destroy(list);

//write score
ini_write_real(ini_name,'score',score);

//write lives
if(save_lives){
    ini_write_real(ini_name,'lives',lives);
}

//write the current rooms name
ini_write_real(ini_name,'room',room);

//write rooms visited
ini_write_string(ini_name,'rooms_visited',ds_map_write(global.rooms_visited));

//write pickups
ini_write_string(ini_name,'pickups',ds_map_write(global.pickups));

//write player position
if(instance_number(player) > 0){
    ini_write_real(ini_name,'player_x', player.phy_position_x);
    ini_write_real(ini_name,'player_y', player.phy_position_y);
}

//write active_check_point
ini_write_string(ini_name,'active_check_point',global.active_check_point);

//close ini
ini_close();
