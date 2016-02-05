//code from light_init
with(obj_light){
    lightsurface = surface_create(radius*2,radius*2);
}
//code from lightmap_init
with(obj_lightmap){
    lightmap=surface_create(room_width,room_height);
}

scan_init();
