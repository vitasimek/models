$fn=6;

w=0.4;

difference()
{
    cylinder(d=100,h=20+2*w);
    
    translate([0,0,w])
    difference()
    {
        cylinder(d=100,h=20);
        cylinder(d=50,h=20);
    }

    cylinder(d=50-2*w,h=20+2*w);
}

for(i=[0:360/$fn:360])
{
    rotate([0,0,i])
    translate([0,-w/2,0])
    #cube([50,w,20+2*w]);
}