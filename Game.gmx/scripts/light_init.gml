//make the radius, color and alpha variables.
radius=argument0;
color=argument1;
alpha=argument2;

//creating the light surface
lightsurface=surface_create(radius*2,radius*2);

cast_fog = false;
on = true;
dir = 270;
angle = 0;
shadows = true;
double = false;
doubleAngle = 5;
static = false; //weather the light is static
rendered = false; //weather we have rendered the static light, set to false to rerender
