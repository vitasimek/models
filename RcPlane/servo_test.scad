

w=0.4*2;
length = 11.84;
height = 18.16-1.6;
width = 32.15;
shift = 2.3;
hole_d =  1.8;

difference()
{
    translate([0,0,0])
    cube ([width,length,height+w]);
    translate([4.255,0,w])
    #import_stl("simple_sg90.stl");
    translate([shift ,length/2,w])
    #cylinder(d=hole_d,h=height,$fn=28);
    translate([width-shift ,length/2,w])
    #cylinder(d=hole_d,h=height,$fn=28);
}