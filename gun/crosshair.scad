
$fn=7*40;

w=2*0.4;
wh=0.35*5;


translate([0,0,15])
rotate([0,-90,0])
import("blank_picatinny.stl");

difference()
{
    union()
    {
        translate([-50,0,0])
        ring(40);
        translate([-50,0,0])
        ring(25);
        translate([-50,0,0])
        ring(10);

        translate([-70,-w/2,0])
        cube([40,w,wh]);
        translate([-70-w/2+40/2,-40/2,0])
        cube([w,40,wh]);

        difference()
        {
            translate([-32.5,-5,0])
            cube([20,10,wh]);
            translate([-50,0,0])
            cylinder(d=40-2*w,h=wh);
        }
    }
    
    translate([-50,0,0])
    cylinder(d=10-2*w,h=wh);
}

module ring(d)
{
    difference()
    {
        cylinder(d=d,h=wh);
        cylinder(d=d-2*w,h=wh);
  }
}