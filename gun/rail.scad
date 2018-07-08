use <Nato_Rail.scad>

$fn=7*20;

w=0;
d=50.5+2*w;
z=d/2-1.25;

rotate([-180,0,0])
difference()
{
    nato_rail (10, false);

    translate([-55,0,-z])
    rotate([0,90,0])
    cylinder(d=d,h=110);
    
    translate([-105/3,0,0])
    screew_hole();

//    translate([0,0,0])
//    screew_hole();

    translate([105/3,0,0])
    screew_hole();
}

module screew_hole()
{
    cylinder(d=3,h=15);
    translate([0,0,5])
    cylinder(d=10,h=10);
}
