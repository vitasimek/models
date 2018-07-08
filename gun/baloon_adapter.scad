$fn=28*4;

w=0.4*4;

difference()
{
    adapter();
    adapter(-w);
}

module adapter(w=0)
{
    d1=50.5;
    d2=35;
    d3=45;
    h1=20;
    h2=5;
    
    translate([0,0,h1+h2+10+5+2])
    cylinder(d1=d3+2*w,d2=d2+2*w,h=5);
    translate([0,0,h1+h2+10+5])
    cylinder(d=d3+2*w,h=2);
    translate([0,0,h1+h2+10])
    cylinder(d1=d2+2*w,d2=d3+2*w,h=5);
    translate([0,0,h1+10])
    cylinder(d=d2+2*w,h=h2);
    translate([0,0,h1])
    cylinder(d1=d1+2*w,d2=d2+2*w,h=10);
    cylinder(d=d1+2*w,h=h1);
}