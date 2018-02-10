
d=6.4;
w=0.4*2;
c=0.2;

x=d+c*2+w*2;

difference()
{
    union()
    {
        translate([-x/2,0,0])
        cube([x,100,5]);
        cylinder(d=x, h=40,$fn=6);
    }
    #translate([0,0,40-2])
    cylinder(d=d, h=3,$fn=6);
}