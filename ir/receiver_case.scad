


width=40;
length=50;
height=25;
w = 2*0.4;
corner_width=4;


bottom_body();
screew_mounting();

module screew_mounting()
{
    d = 1;
    h = 10;
    translate([10, 10, w])
    difference()
    {        
        cylinder(d=d+2*w, h=h,$fn=14);
        #cylinder(d=d, h=h,$fn=14);
    }
}



module bottom_body()
{
    outer_case(width + 2*corner_width, length  + 2*corner_width, height);
    corner();
}

// TODO: POSTPONED
module corner()
{
    width=corner_width;
    difference()
    {
        translate([w,w,w])
        cube([width, width, height-w]);
        translate([width/2+w,width/2+w,w])
        #cylinder(d=2,h=height);
    }
}


module outer_case(width, length, height)
{
    difference()
    {
        case_cube(width, length, height, w=2*w);
        translate([w,w,w])
        case_cube(width, length, height);
    }
}

module case_cube(width, length, height, w=0)
{
    cube([width+w, length+w,height]);
}
