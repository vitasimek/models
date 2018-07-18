$fn=14*2;

h=0.35*10;
d1=4;
d2=2.6;

difference()
{
    cube([110,15,h]);

    translate([d1/2+5,0,0])
    hole(d1, d2);
    translate([110-5-d1/2,0,0])
    hole(d1, d2);
    hull()
    {
        translate([1.25*13+3,15/2,0])
        #cylinder(d=9,h=h);
        translate([3.5*13+3,15/2,0])
        #cylinder(d=9,h=h);
    }
    hull()
    {
        translate([4.5*13+3,15/2,0])
        #cylinder(d=9,h=h);
        translate([6.75*13+3,15/2,0])
        #cylinder(d=9,h=h);
    }
}

module hole(d1=4,d2=3,s=0)
{
    translate([0,7-s,0])
    #cylinder(d=d1,h=h);
     
    translate([0,0,0])
    #hull()
    {
        translate([0,0,0])
        cylinder(d=4,h=h);
        translate([0,4.5,0])
        cylinder(d=d2,h=h);
    }
}


//difference()
//{
//    cube([25,15,h]);
//
//    translate([8*1/2,0,0])
//    hole(4, 3);
//    translate([8*3/2,0,0])
//    hole(4, 2.5);
//}
