//open the ini
ini_open('saves.ini');

var ini_name = argument0;

//write score
ini_write_real(ini_name,'score',score);

//close ini
ini_close();
