//static
if(static == false || rendered == false){
    global.lights_rendered += 1;
    
    //draw onto the lightsurface created in light_init()
    surface_set_target(lightsurface);
    
    //clear the surface
    draw_clear(c_black);
    
    //set the alpha value
    //draw_set_alpha(alpha);
    
    //if(on){ dont bother with "on" the light map will test "on"
        //draw a circle with the provided colors in the center of the surface.
        if(angle == 0){
            draw_circle_color(radius,radius,radius,color,c_black,false);
        }
        else{
            draw_primitive_begin(pr_trianglefan);
            
            draw_vertex_colour(radius,radius,color,alpha);
            
            var startDir = dir - abs(angle/2);
            for(var d = 0; d < abs(angle); d += 1){
                draw_vertex_colour(radius + (radius * cos(degtorad(startDir + d))),radius + (radius * sin(degtorad(startDir + d))),c_black,1);
            }
            
            draw_primitive_end();
            
            if(double){
                //draw light
                draw_primitive_begin(pr_trianglefan);
                
                draw_vertex_colour(radius,radius,color,alpha/2);
                
                var startDir = dir - abs(angle/2);
                for(var d = 0; d < abs(angle); d += 1){
                    draw_vertex_colour(radius + (radius * cos(degtorad(startDir + d))),radius + (radius * sin(degtorad(startDir + d))),c_black,1);
                }
                
                draw_primitive_end();
                
                //draw double
                draw_primitive_begin(pr_trianglefan);
                
                draw_vertex_colour(radius,radius,color,alpha/2);
                
                var startDir = dir - (abs(angle)+doubleAngle)/2;
                for(var d = 0; d < abs(angle)+doubleAngle; d += 1){
                    draw_vertex_colour(radius + (radius * cos(degtorad(startDir + d))),radius + (radius * sin(degtorad(startDir + d))),c_black,1);
                }
                
                draw_primitive_end();
            }
            else{
                //draw light
                draw_primitive_begin(pr_trianglefan);
                
                draw_vertex_colour(radius,radius,color,alpha);
                
                var startDir = dir - abs(angle/2);
                for(var d = 0; d < abs(angle); d += 1){
                    draw_vertex_colour(radius + (radius * cos(degtorad(startDir + d))),radius + (radius * sin(degtorad(startDir + d))),c_black,1);
                }
                
                draw_primitive_end();
            }
        }
        
        //reseting the alpha value
        draw_set_alpha(1);
        
        //set the color to black
        draw_set_color(c_black);
        
        //making a temp object variable for the with loop.
        var object;
        object = id;
    
        //loop through all shadow casters
        if(shadows){
            with(obj_shadowcaster){
                if(enabled){
                    if(bbox_left < object.x+object.radius &&
                        bbox_right > object.x-object.radius &&
                        bbox_top < object.y+object.radius && 
                        bbox_bottom > object.y-object.radius){
                        
                        //begin drawing primitives, triangle strip, because then each point connects with every other point.
                        draw_primitive_begin(pr_trianglestrip);
                        
                        //loop through all the casting points.
                        for(i=0;i<cast_points;i+=1){
                            /*
                            searching for the relative position of the point on the light's surface.
                            x+cast_x[i] means the absolute position of the point that we want to draw now.
                            
                            -object.x means we subtract the x position of the light.
                            
                            we add the object.radius, the radius of the light, because shadows cast from the center
                                of the light, and not from the top left corner.
                            */
                            tempx = x+cast_x[i]-object.x+object.radius;
                            
                            //same for tempy
                            tempy = y+cast_y[i]-object.y+object.radius;
                            
                            //the direction between the relative point and the center of the surface.
                            //we add 180 to 'invert' the rotation.
                            dir = point_direction(tempx,tempy,object.radius,object.radius)+180;
                            
                            //draw the first vertex.
                            draw_vertex(tempx,tempy);
                            
                            //draw the second vertex, use lengthdir_x and lenghtdir_y to go radius*8 into the shadows direction.
                            draw_vertex(tempx+lengthdir_x(object.radius*8,dir),tempy+lengthdir_y(object.radius*8,dir));
                        }
                        
                        //now just one more to close the circle, this is exactly the same as above, so I won't add millions of comments
                        tempx = x+cast_x[0]-object.x+object.radius;
                        tempy = y+cast_y[0]-object.y+object.radius;
                        dir = point_direction(tempx,tempy,object.radius,object.radius)+180;
                        draw_vertex(tempx,tempy);
                        draw_vertex(tempx+lengthdir_x(object.radius*8,dir),tempy+lengthdir_y(object.radius*8,dir));
                        
                        //end primitives
                        draw_primitive_end();
                    
                    }
                }
            }
        }
    //}
    
    //reset the target surface;
    surface_reset_target();
    rendered = true;
}
