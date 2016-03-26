var offset = 24;
var sp = 10;

if(place_meeting(x,y,player)){
    if(self.draw_text_on_over_offset < offset){
        self.draw_text_on_over_offset += (offset - self.draw_text_on_over_offset) / sp;
    }
    else self.draw_text_on_over_offset = offset;
}
else {
    if(self.draw_text_on_over_offset > 0){
        self.draw_text_on_over_offset -= self.draw_text_on_over_offset / sp;
    }
    else self.draw_text_on_over_offset = 0;
}

if(self.draw_text_on_over_offset > 0){
    draw_set_halign(fa_center);
    draw_set_valign(fa_bottom);
    draw_set_color(c_white);
    draw_text_colour((bbox_left+(bbox_right - bbox_left)/2),(bbox_top+(bbox_bottom - bbox_top)/2) - self.draw_text_on_over_offset,argument0,c_white,c_white,c_white,c_white,self.draw_text_on_over_offset/offset);
    
    //reset
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
}
