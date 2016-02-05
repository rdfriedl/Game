///create scan surface
global.scan_w = sprite_get_width(scan_spr)*2;
global.scan_h = sprite_get_height(scan_spr)*2;
surface_resize(global.scan_surface_draw,global.scan_w,global.scan_h);
surface_resize(global.scan_surface_sprite,global.scan_w,global.scan_h);
surface_resize(global.scan_surface_composite,global.scan_w,global.scan_h);
