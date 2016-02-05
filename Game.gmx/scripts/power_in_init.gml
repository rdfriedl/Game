on=true
pow=-1
in=-1
//get the power box
for (i=0; i<instance_number(power_obj); i+=1)
{
    in=instance_find(power_obj,i)
    if(in.image_blend==self.image_blend)
    {
        pow=in
    }
}
//see if there was one
if(in==-1)
{
    show_error('missing a power box, with color:'+string(image_blend),true)
}
