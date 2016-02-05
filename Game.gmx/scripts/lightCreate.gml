/*
    lightCreate(range)
*/

with instance_create(0,0,oLight)
{
    range=argument0
    surfLight=surface_create(range*2,range*2)
        
    return id
}