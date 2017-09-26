

radius = 24.3;
wall = 2;


//spoon(radius, wall, 1);
//translate([radius *2.2, 0, 0])
spoon(radius/4*3, wall, 2);

module spoon(radius, wall, scale)
{
    difference()
    {
        spoon_half_sphere(radius+wall, scale);
        spoon_half_sphere(radius, scale);
    }

    handle_width = 5;
    handle_length = 150;

    hull() {
    translate([radius, -handle_width/2, 0])
    cube([handle_length, handle_width, handle_width]);

    translate([radius+handle_length, 0, handle_width*1.1])
    sphere(r=handle_width*1.1);
    }
}

module spoon_half_sphere(radius, scale)
{
    scale([1,1,scale])
    difference()
    {
        sphere(r=radius);
        translate([0, 0, -radius/2])
        cube([2*radius, 2*radius, radius], true);
    }
}