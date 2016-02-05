if(global.scanning){
    var active_time = 2;
    var start_time = 1;
    
    //stop drawing the scan
    global.draw_scan = false;
    
    //draw scan
    if(global.scan_time <= start_time*2 + active_time){
    
        //set surface
        surface_set_target(global.scan_surface_sprite);
        draw_clear_alpha(c_black,1);
        
        if(global.scan_time <= start_time){
            _scale = 1-power(1-global.scan_time,3);
            _scale = round(_scale * 100) / 100;
            
            if(audio_is_playing(scan_start_snd) == false){
                audio_play_sound(scan_start_snd,backgroundSoundPriority,false);
            }
        }
        else _scale = 1;
        
        if(global.scan_time > start_time + active_time){
            _fade = 1+power((global.scan_time - start_time - active_time) * -1,3);
            
            if(audio_is_playing(scan_end_snd) == false){
                audio_play_sound(scan_end_snd,backgroundSoundPriority,false);
            }
        }
        else _fade = 1;
        
        //draw
        draw_set_blend_mode(bm_subtract);
        draw_sprite_ext(scan_spr,0,global.scan_w/2,global.scan_h/2,_scale*2,_scale*2,0,c_black,_fade); //draw relative to view
        draw_set_blend_mode(bm_normal);
        global.scan_time += 1 / room_speed;
        
        //reset
        surface_reset_target();
    }
    else{
        global.scanning = false;
        global.scan_time = 0;
    }
    
    //composite the scans
    surface_set_target(global.scan_surface_composite);
    
    draw_set_blend_mode(bm_normal);
    if(surface_exists(global.scan_surface_draw)){
        draw_surface(global.scan_surface_draw,0,0);
    }
    
    draw_set_blend_mode(bm_subtract);
    if(surface_exists(global.scan_surface_sprite)){
        draw_surface(global.scan_surface_sprite,0,0);
    }
    
    //reset
    draw_set_blend_mode(bm_normal);
    surface_reset_target();
}
