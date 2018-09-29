


d=150;
w=7.5;
h=60;
hs=30;

dc=20;

difference()
{
    hull()
    {
        cylinder(d=d,h=h);
        holder(w,60);
    }
    cylinder(d=d-2*w,h=h+5);
    for(i =  [0:360/10:360])
    {
        rotate([0,0,i])
        translate([0,0,hs])
        n_teeth();        
    }
    #holder(0,60+20);
}

module holder(w=0,h=60)
{
    difference()
    {
        translate([d/2+30,0,-10])
        rotate([0,-90/4*1,0])
        cylinder(d1=dc+2*w+5, d2=dc+2*w,h=h);
        
        translate([-500,-500,-100])
        cube([1000,1000,100]);
    }
}

module n_teeth()
{
    h=d/2;
    rotate([90,0,0])
    hull()
    {
        cylinder(d=10,h=h);
        translate([0,50,0])
        cylinder(d=40,h=h);
    }
}