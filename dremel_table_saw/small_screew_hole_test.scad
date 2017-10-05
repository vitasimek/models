


difference()
{
    cube([10, 10, 3]);
    
    translate([3, 3, 0])
    cylinder(d=1.6, h=3, $fn=28);
    translate([7, 3, 0])
    cylinder(d=1.7, h=3, $fn=28);
    translate([3, 7, 0])
    cylinder(d=1.8, h=3, $fn=28);
    translate([7, 7, 0])
    cylinder(d=1.9, h=3, $fn=28);
}
