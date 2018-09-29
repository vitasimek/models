$fn=21*4;

d=40;
hz=10;

difference()
{
    #cylinder(d=2.5+2*2*0.4+5,h=10);    
    #cylinder(d1=2.5,d2=2.2,h=10);    
    
    translate([0,0,-100/2])
    cube([100,100,100],center=true);
}