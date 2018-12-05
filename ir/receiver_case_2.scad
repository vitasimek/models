


w=0.4*2;


difference()
{
    cube([55, 75,10]);
    translate([w,w,w])
    cube([55-2*w, 75-2*w,10]);
}