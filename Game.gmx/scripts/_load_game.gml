var ini_name = argument0;
var load_lives = argument1;

//open ini
ini_open('saves.ini');

//read power grids
var str = ini_read_string(ini_name,'power_grids','');
if!(str == ''){
    var list = ds_list_create();
    ds_list_read(list,str);
    
    for(var i = 0; i < ds_list_size(list); i+=1){
        var name = ds_list_find_value(list,i);
        
        var m = ini_read_string(ini_name,'power_grid_'+string(name),'');
        if!(m == ''){
            var grid = ds_map_create();
            ds_map_read(grid,m);
            power_grid_set(name,grid);
        }
    }
    
    ds_list_destroy(list);
}

//read score
score = ini_read_real(ini_name,'score',score);

//read lives
if(load_lives){
    lives = ini_read_real(ini_name,'lives',lives);
}

//read room_visited
var str = ini_read_string(ini_name,'rooms_visited','');
if!(str = ''){
    ds_map_read(global.rooms_visited,str);
}

//read pickups
var str = ini_read_string(ini_name,'pickups','');
if!(str = ''){
    ds_map_read(global.pickups,str);
}

//read the player position
global.load_player_x = ini_read_real(ini_name,'player_x',0);
global.load_player_y = ini_read_real(ini_name,'player_y',0);

//read active checkpoint
global.active_check_point = ini_read_string(ini_name,'active_check_point','');

//load room
var ini_room = ini_read_real(ini_name,'room',room)
room_goto(ini_room);

//close ini
ini_close();
