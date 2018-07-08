


h=0.35*4;
w=5;


difference()
{
    translate([-2,-w/2,0])
    cube([13*2*5+5,w,h]);

    for(i = [1:13*2])
    {
        translate([i*5,0,0])
        cylinder(d=2.1,h=h, $fn=28);
    }
}

cylinder(d1=4,d2=0.1,h=h*2, $fn=28);
//cube([])