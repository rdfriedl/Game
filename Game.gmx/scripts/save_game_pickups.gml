//open the ini
ini_open('saves.ini');

var ini_name = argument0;

//write pickups
ini_write_string(ini_name,'pickups',ds_map_write(global.pickups));

//close ini
ini_close();
