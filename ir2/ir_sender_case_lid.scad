width = 71;
length = 48;
height = 50;

w=0.4*4;


difference()
{
    union()
    {
        cube([width+2*w,length+2*w,w]);

        translate([w,w,w])
        round_cube(width, length, 12);
        //cube([width,length,6]);
    }

    translate([w,w,w])
    translate([w,w,-w/3])
    #cube([width-2*w,length-2*w,12+w]);
    translate([10,0,-w])
    #cube([5,5,16]);
}


module round_cube(width, length, height)
{
    $fn=21;
    d = 5;
    
    translate([d/2,d/2,0])
    hull()
    {
        translate([0,0,0])
        cylinder(d=d,h=height);
        translate([width-d,0,0])
        cylinder(d=d,h=height);
        translate([width-d,length-d,0])
        cylinder(d=d,h=height);
        translate([0,length-d,0])
        cylinder(d=d,h=height);
    }
    
}