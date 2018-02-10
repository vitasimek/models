

r=7;

rotate([0,0,90])
sliders(r=r+1.75);
sliders(r=r);

module sliders(r, space=1.75)
{
    translate([0,-space,0])
    slider(r=r);
    translate([0,space,0])
    slider(r=r);

    rotate([0,90,0])
    translate([0,0,-r*2])
    #cylinder(d=1.75,h=r*4,$fn=28);
}

module slider(r)
{
    angle = 180;
    rest = 180-angle;
    $fn=100;
    rotate([90,-rest/2,0])
    rotate_extrude(angle=angle,convexity=10)
    translate([r,0,0])
    circle(d=1.75,$fn=28);
}