use<ring.scad>

fn=8;
hg=0.2+0.3*3;
//hg=0.2+0.3*5;
h=20;
w=0.4*2;
width=200;

body();

module body()
{
    stackable_body(width, h, hg, w, fn);

    difference()
    {
        rotate([0,0,45/2])
        cylinder(d=200-10,h=hg,$fn=fn);
        cylinder(d=117,h=hg,$fn=77);
        
        xs=106;
        
        translate([xs/2,xs/2,0])
        cylinder(d=5,h=hg,$fn=28);
        translate([xs/2,-xs/2,0])
        cylinder(d=5,h=hg,$fn=28);
        translate([-xs/2,xs/2,0])
        cylinder(d=5,h=hg,$fn=28);
        translate([-xs/2,-xs/2,0])
        cylinder(d=5,h=hg,$fn=28);
    }
}
