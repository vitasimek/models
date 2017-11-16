$fn=77;
use <wings.scad>;

length = 20;
basewidth = 150;  

difference()
{
hull()
{
//    translate([-length/2,0,18])
//    straight_wing( length, basewidth);

    translate([0,-150/3*2,0])
    scale([1,1.68,1])
    sphere(d=50);

//translate([0,150/3*2,0])
//rotate([90,0,0])
//cylinder(d=50,h=150);

    translate([0,150/3*2+100,0])
    scale([1,1.68,1])
    sphere(d=20);
 }
//translate([-length*3/2,0,18])
//#straight_wing( length, basewidth);
//translate([length/2,0,18])
//#straight_wing( length, basewidth);
}