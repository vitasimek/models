

w = 1.2;
bearing_d = 15.05;
bearing_h = 24;

mounting_h = bearing_h+2*w;
mounting_width = bearing_d+2*w;

table_width=160;

difference()
{
    union()
    {
        translate([mounting_width/2,0,10])
        bearing_mounting();
        translate([table_width+w-mounting_width/2,0,10])
        bearing_mounting();

        translate([mounting_width/2,table_width+w-mounting_h,10])
        bearing_mounting();
        translate([table_width+w-mounting_width/2,table_width+w-mounting_h,10])
        bearing_mounting();

        for(i = [0:5:table_width])
        {
            translate([0,i,0])
            cube([table_width+w, w, 10]);
            translate([i,0,0])
            cube([w,table_width+w,10]);
        }

        screew_holes(0.8*2+2.75);
    }
    screew_holes(2.75);
}

module screew_holes(d)
{
    for(i = [5:10:table_width-5])
    for(j = [5:10:table_width-5])
    {
        translate([i+w/2,j+w/2,0])
        cylinder(d=d,10,$fn=28);
    }
}

module bearing_mounting()
{
    translate([0,0,mounting_width/2+w])
    rotate([-90,0,0])
    difference()
    {
        translate([-mounting_width/2,0,0])
        cube([mounting_width, mounting_width/2+w, mounting_h]);
        translate([0,w,0])
        bearing(w);
    }
}

module bearing(w=0)
{
    cylinder(d=bearing_d-2*w, h=w,$fn=77);
    translate([0,0,w])
    cylinder(d=bearing_d, h=bearing_h,$fn=77);
    translate([0,0,w+bearing_h])
    cylinder(d=bearing_d-2*w, h=w,$fn=77);
}