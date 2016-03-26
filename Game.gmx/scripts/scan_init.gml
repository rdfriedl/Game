///create scan surface
global.scan_surface_draw = surface_create(10,10);
global.scan_surface_sprite = surface_create(10,10);
global.scan_surface_composite = surface_create(10,10);
global.scan_time = 0;
global.scanning = false;
global.draw_scan = false;
global.scan_x = 0;
global.scan_y = 0;

scan_resize();
