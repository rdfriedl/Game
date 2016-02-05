if(kongGetAPI()){
    kongSubmitStat('score',score);
    kongSubmitStat('rooms_explored',ds_map_size(global.rooms_visited));
}
