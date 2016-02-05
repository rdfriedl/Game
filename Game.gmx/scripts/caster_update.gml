//update points based off object rotation
for(var i = 0; i < cast_points; i+=1){
    cast_x[i] = rotate_point_x(cast_point_x[i],cast_point_y[i], -image_angle);
    cast_y[i] = rotate_point_y(cast_point_x[i],cast_point_y[i], -image_angle);
}
