



h=0.35*4;



difference()
{
    union()
    {
        difference()
        {
            cylinder(d=100,h=h,$fn=77);
            cylinder(d=90,h=h,$fn=77);
        }
        translate([-5/2,-95/2,0])
        cube([5,95,h]);
    }
    
    for(i=[0:360/3/2/2/2:360])
    {
        rotate([0,0,i])
        translate([0,-95/2,0])
        #cylinder(d1=3,d2=2,h=h,$fn=14);
    }
}


cylinder(d1=4,d2=0.1,h=4);

translate([0,-95/2+10,0])
cylinder(d1=4,d2=0.1,h=4);
translate([0,+95/2-10,0])
cylinder(d1=4,d2=0.1,h=4);
