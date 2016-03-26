var a = -1;
var lights = instance_number(obj_light);
for(var i = 0; i < lights; i+=1){
    var inst = instance_find(obj_light,i);
    for(var k = 0; k < cast_points; k+=1){
        var _x = x + cast_x[k];
        var _y = y + cast_y[k];
        if(point_distance(_x,_y,inst.x,inst.y) < inst.radius){
            var d = point_direction(_x,_y,inst.x,inst.y);
            if(d < fix_dir(inst.dir+inst.angle/2) && d > fix_dir(inst.dir-inst.angle/2) || inst.angle == 0){
                a[array_length_1d(a)] = inst;
            }
        }
    }
}
return a;
