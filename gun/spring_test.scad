
d=40;
w=0.4*5;


xxx(d);
//translate([0,0,20])
xxx(d-2*w*2*2);

module xxx(d)
{
    difference()
    {
        cylinder(d=d+2*w,h=10,$fn=49);
        translate([0,0,0])
        cylinder(d=d,h=10,$fn=49);
    }
}