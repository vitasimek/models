

width = 73;
length = 144;
height = 10;
wall = 0.8*2;

difference()
{
    case();
    translate([wall, wall, wall])
//    mobil();
    translate([-width/2,  0,  0])
    cube([width*2, length/2, 20]);
}

module mobil()
{
    hull()
    {
        cube([width, length, height]);
        translate([1,1,wall])
        cube([width-2, length-2, height]);
    }
}

module case()
{
    //hull()
    {
        cube([width+wall*2, length+wall*2, height]);
        translate([wall+1, wall+1, wall])
        cube([width+wall*2-1, length+wall*2-1, height+wall]);
    }
}

module usb_hole()
{
}