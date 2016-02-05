var a = caster_get_lights();
for(var i = 0; i < array_length_1d(a)-1; i+=1){
    if((a[i]).static){
        (a[i]).rendered = false;
    }
}
