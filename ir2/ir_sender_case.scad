
width = 71;
length = 48;
height = 50;

w=0.4*4;
h=10-w;
d=3.5;


translate([-w,-w,0])
difference()
{
    cube([width+2*w,length+2*w,height]);
    translate([w,w,0])
    cube([width,length,height]);
}    

bottom_side(width,length,w);

module bottom_side(width,length,w)
{
    difference()
    {
        cube([width,length,w]);
        translate([10,length/2,0])
        cylinder(d=5,h=w,$fn=28);
    }
}
