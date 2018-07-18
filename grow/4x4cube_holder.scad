

w=0.4*2;

height=35;
width=35;

magnetic_cube_width=5.2;

x=2;


translate([magnetic_cube_width+2*w,magnetic_cube_width+2*w,0])
for (i = [0:x-1])
for (j = [0:x-1])
{
    translate([width*i, width*j,0])
    cube_holder();
}


bottom_width=2*magnetic_cube_width+6*w+width*x-5;
difference()
{
    cube([bottom_width,bottom_width,7]);
    translate([w,w,w])
    cube([bottom_width-2*w,bottom_width-2*w,7]);
    
    translate([magnetic_cube_width+2*w,magnetic_cube_width+2*w,0])
    for (i = [0:x-1])
    for (j = [0:x-1])
    {
        translate([width*i, width*j,0])
        translate([w,w,0])
        #cube_shape(27+w);
    }
}


//magnet_cube();
//translate([magnetic_cube_width+4*w+width*x-5,magnetic_cube_width+4*w+width*x-5,0])
//magnet_cube();

module cube_holder()
{
    difference()
    {
        cube_shape(27, w);
        translate([w,w,0])
        cube_shape(27+w);
    }
}

module cube_shape(h, w=0)
{
    upper_width=17+2*w;
    middle_width=22+2*w;
    bottom_width=30+2*w;

    translate([0,0,8])
    translate([bottom_width/2,bottom_width/2,0])
    rotate([0,0,45])
    cylinder(d1=to_diameter(middle_width), d2=to_diameter(upper_width), h=h, $fn=4);

    translate([bottom_width/2,bottom_width/2,0])
    rotate([0,0,45])   
    cylinder(d1=to_diameter(bottom_width),d2=to_diameter(middle_width), h=8, $fn=4);
}

function to_diameter(width) = width /  sqrt(2) * 2;

module magnet_cube()
{
    difference()
    {
        magnet_cube_shape(magnetic_cube_width, w);
        translate([w,w,2*w])
        magnet_cube_shape(magnetic_cube_width);
        translate([magnetic_cube_width/2,0,2*w])
        cube([2*w,magnetic_cube_width+2*w,7]);
        translate([0,magnetic_cube_width/2,2*w])
        cube([magnetic_cube_width+2*w,2*w,7]);
    }
}

module magnet_cube_shape(width, w=0)
{
    width=width+2*w;
    
    cube([width,width,7]);
}
