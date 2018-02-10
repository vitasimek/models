
rod_d = 8;
w=0.4*6;


difference()
{
    rod_holder(rod_d, w);
    #rod_space_and_hole(rod_d);
    translate([0,-11,0])
    screew_hole(d=3);
    translate([0,-11,0])
    screew_nut_hole(d=6.2);

    translate([0,13,-2])
    screew_hole(d=3);
    translate([0,13+10,-2])    
    screew_hole(d=3);
}


module rod_holder(rod_d, w)
{
    width = rod_d+2*w;
    cylinder(d=width ,h=10,$fn=49);
    translate([-width/2,-17,0])
    {
        cube([width,17,10]);
        cube([w,50,10]);
    }
    translate([width/2,-11,5])
    rotate([90,0,90])
    cylinder(d=11.6,h=2,$fn=6);
}

module screew_hole(d=3)
{
    translate([-10,0,10/2])
    rotate([0,90,0])
    cylinder(d=d,h=20,$fn=49);
}

module screew_nut_hole(d=6)
{
    width = rod_d+2*w;
    
    translate([width/2,0,10/2])
    rotate([90,90,90])
    #cylinder(d=d,h=2,$fn=6);
}

module rod_space_and_hole(rod_d)
{
    rod(rod_d);
    rod_space(rod_d);
}

module rod(d=8)
{
    translate([0,0,-5])
    cylinder(d=d,h=20,$fn=49);
}

module rod_space(d=8)
{
    translate([-7.5/2,-20,-5])
    cube([7.5,20,20]);
}