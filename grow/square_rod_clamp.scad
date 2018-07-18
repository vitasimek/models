
w=0.4*8;
ww=w;
width=9;
h=10;
x=2.1/2.2;

translate([x,0,0])
branch();
mirror()
translate([x,0,0])
branch();

translate([0,14,0])
//rotate([0,0,])
spring();

module spring(w=0.4*2)
{
    d=20;
    difference()
    {
        cylinder(d=d+2*w,h=h,$fn=49);
        cylinder(d=d,h=h,$fn=49);
        translate([-(d+2*w)/2-1/2,-8,0])
        #cube([d+4*w,d/2+3,10]);
    }
}

module branch()
{
    rotate([0,0,-10])
    difference()
    {
        cube([4.5,50,10]);
        translate([0,2,0])
        #cube([2,9.3,10]);
        cylinder(d=20,h=h,$fn=49);
    }
}
//
//cube([w,width*6+ww,h]);
//translate([w+width,0,0])
//cube([w,width*6+ww,h]);
//
//translate([w/3,0,0])
//cube([w,w,h]);
//translate([w/3*2+width,0,0])
//cube([w,w,h]);
//
//
//difference()
//{
//    translate([0,w,0])
//    spring(w=w);
//    translate([w,w,0])
//    #spring();
//}
//
//module spring(w=0)
//{
//    //hull()
//    {
//        cube([2*w+width,width+w+0.4,h]);
//        translate([width/2+w,width+ww,0])
//        scale([1,1.5,1])
//        cylinder(d=width+1.5*w,h=h,$fn=49);
//    }
//}