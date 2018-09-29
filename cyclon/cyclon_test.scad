

w=4;
da = 200;
ha = 300;
db = 50;

cylinder(d=da, h=ha);


hull()
{
    translate([100,-da/2+db/2,db/2])
    rotate([0,90,0])
    cylinder(d=db, h=30);

    translate([0,-da/2,0])
    cube([10,db,db]);
}

translate([0,0,ha])
cylinder(d1=da, d2=da/2, h=300);
