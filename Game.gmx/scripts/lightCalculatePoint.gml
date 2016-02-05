/*
    lightCalculatePoint(light,x,y,range,color)
    
    0 light id
    1 x position
    2 y
    3 color
    
    calculates a trianglefan image and draws it to this lights surface.
    all the lights surfaces will be merged together later
*/

var rayx,rayy,stepSize,dx,dy,tx,ty,bx,by,totalRays,lowestDistance,m,a,i,j;

with argument0
{
    x=argument1-range
    y=argument2-range
    stepSize=2
    totalRays=0
    
    //make a bunch of ray traces in a circle
    for(i=0 i<360 i+=stepSize)
    {
        lowestDistance=range
        
        dx=lengthdir_x(1,i)
        dy=lengthdir_y(1,i)
        
        bx=argument1+dx*lowestDistance
        by=argument2+dy*lowestDistance
        
        //find the nearest solid that is within range
        j=0
        
        while 1
        {
            a[j]=collision_line(argument1,argument2,bx,by,wall_par,false,true)
            
            if a[j]=noone break
            
            //use some fancy math to calculate the position of the ray
            with a[j]
            {
                if dx>0
                {
                    if argument1<x
                    {
                        //find distance
                        m=(x-argument1)/dx
                        
                        //are we closer than the lowest distance?
                        if m<lowestDistance
                        {
                            //check if the position is inside the box
                            ty=argument2+dy*m
                                
                            if ty>=bbox_top
                            if ty<=bbox_bottom
                            {
                                //now it becomes the lowest distance
                                lowestDistance=m
                            }
                        }
                    }
                }
                else if dx<0
                {
                    if argument1>bbox_right
                    {
                        m=(bbox_right-argument1)/dx
                        
                        if m<lowestDistance
                        {
                            ty=argument2+dy*m
                                
                            if ty>=bbox_top
                            if ty<=bbox_bottom
                            {
                                lowestDistance=m
                            }
                        }
                    }
                }
                
                if dy>0
                {
                    if argument2<y
                    {
                        m=(y-argument2)/dy
                        
                        if m<lowestDistance
                        {
                            tx=argument1+dx*m
                                
                            if tx>=bbox_left
                            if tx<=bbox_right
                            {
                                lowestDistance=m
                            }
                        }
                    }
                }
                else if dy<0
                {
                    if argument2>bbox_bottom
                    {
                        m=(bbox_bottom-argument2)/dy
                        
                        if m<lowestDistance
                        {
                            tx=argument1+dx*m
                            
                            if tx>=bbox_left
                            if tx<=bbox_right
                            {
                                lowestDistance=m
                            }
                        }
                    }
                }
            }
            
            //move instance far away so collision_line can find the next wall
            a[j].x+=999999
            j+=1
        }
        
        //move all instances back
        while j>0
        {
            j-=1
            a[j].x-=999999
        }
        
        //we're gonna go a bit further than the raytrace, just for looks
        //lowestDistance+=64
        
        //calculate the position of ray in the surfaces space
        rayx[totalRays]=range+dx*lowestDistance
        rayy[totalRays]=range+dy*lowestDistance
        raya[totalRays]=1-lowestDistance/range
        totalRays+=1
    }
    
    if totalRays>1
    {
        //cycle around in a circle drawing all the rays
        surface_set_target(surfLight)
        draw_clear_alpha(0,0)
        draw_primitive_begin(pr_trianglefan)
        
        //the first vertex will be in the center of the surface
        draw_vertex_color(range,range,argument3,1)
        
        for(i=0;i<totalRays;i+=1) draw_vertex_color( rayx[i], rayy[i], argument3, raya[i])
        
        draw_vertex_color( rayx[0], rayy[0], argument3, raya[0])
        draw_primitive_end()
        surface_reset_target()
    }
}