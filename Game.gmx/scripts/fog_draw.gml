//set the blend mode to multiply, search for tutorials on this, the explanation is to long.
draw_set_blend_mode(bm_add);

//draw the surface onto the screen.
draw_surface(fog,0,0);

//reset the blend mode
draw_set_blend_mode(bm_normal);
