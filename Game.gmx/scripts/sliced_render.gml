///sliced render
//top right corner
var w = sprite_get_width(sprite_index);
var h = sprite_get_height(sprite_index);
var w2 = w/3;
var h2 = h/3;

//corners
draw_sprite_part_ext(sprite_index,image_index,0,0,w2,h2,bbox_left,bbox_top,1,1,image_blend,image_alpha); //top left
draw_sprite_part_ext(sprite_index,image_index,w - w2,0,w2,h2,bbox_right - w2,bbox_top,1,1,image_blend,image_alpha); //top right
draw_sprite_part_ext(sprite_index,image_index,0,h - h2,w2,h2,bbox_left,bbox_bottom - h2,1,1,image_blend,image_alpha); //bottom left
draw_sprite_part_ext(sprite_index,image_index,w - w2,h - h2,w2,h2,bbox_right - w2,bbox_bottom - h2,1,1,image_blend,image_alpha); //bottom right

//sides
draw_sprite_part_ext(sprite_index,image_index,0,h2,w2,h2,bbox_left,bbox_top+h2,1,((bbox_bottom-h2)-(bbox_top+h2))/h2,image_blend,image_alpha); //left
draw_sprite_part_ext(sprite_index,image_index,w-w2,h2,w2,h2,bbox_right-w2,bbox_top+h2,1,((bbox_bottom-h2)-(bbox_top+h2))/h2,image_blend,image_alpha); //right
draw_sprite_part_ext(sprite_index,image_index,w2,0,w2,h2,bbox_left+w2,bbox_top,((bbox_right-w2)-(bbox_left+w2))/w2,1,image_blend,image_alpha); //top
draw_sprite_part_ext(sprite_index,image_index,w2,h-h2,w2,h2,bbox_left+w2,bbox_bottom-h2,((bbox_right-w2)-(bbox_left+w2))/w2,1,image_blend,image_alpha); //bottom

//center
draw_sprite_part_ext(sprite_index,image_index,w2,h2,w2,h2,bbox_left+w2,bbox_top+h2,((bbox_right-w2)-(bbox_left+w2))/w2,((bbox_bottom-h2)-(bbox_top+h2))/h2,image_blend,image_alpha)
