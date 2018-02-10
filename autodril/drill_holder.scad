

fn=77;
h=1.5;
screew_hole_d=3.5;
width=60;
length=60;
holes_width=18.75;
holes_length=46.75;
main_hole_d=41;

//mirror()
difference()
{
    union()
    {
        cube([length,width,h*2]);
        
        translate([length/2-6/2,0,0])
        cube([6,width/2,30]);

        
        //translate([length/2,width/2,0])
        //cylinder(d=main_hole_d, h=h*2,$fn=49);
        translate([length/2,width/2,0])
        cylinder(d=main_hole_d, h=30,$fn=fn);        
    }
    translate([length/2-holes_length/2,width/2-holes_width/2,0])
    screew_holes();
    translate([length/2,width/2,0])
    #drill();
    
    translate([length/2,-5,-5])
    #cube([0.4,40,40]);
    
   half_screew_holes();
//    translate([0,width-2*5,0])
//   half_screew_holes();
    
    translate([length/2-11/2,width/2-37/2-1,0])
    #cube([10,10,10]);

    translate([length/2-13,width+4,0])
    #cylinder(d=20,h=2*h);
    translate([length/2+13,width+4,0])
    #cylinder(d=20,h=2*h);
}



module half_screew_holes()
{
    translate([length/2-20/2,5,10])
    rotate([0,90,0])
    #cylinder(d=3,h=20,$fn=fn);
    translate([length/2-20/2,5,20])
    rotate([0,90,0])
    #cylinder(d=3,h=20,$fn=fn);
}

module drill()
{
    fn=fn;

    hull()
    {
        cylinder(d1=27,d2=37-0.32,h=10,$fn=fn);
        scale([33.4/37,1,1])
        {
            translate([0,0,10])
            cylinder(d1=37-0.32,d2=35.5+2,h=20,$fn=fn);
        }
    }
    
//    scale([33.4/37,1,1])
//    {
//        cylinder(d1=27,d2=37,h=10,$fn=fn);
//        translate([0,0,10])
//        cylinder(d1=37,d2=35.5,h=20,$fn=fn);
//    }
}


module screew_holes()
{
//    translate([0,0,0])
    screew_hole();
    translate([holes_length,0,0])
    screew_hole();
    translate([holes_length,holes_width,0])
    screew_hole();
    translate([0,holes_width,0])
    screew_hole();
}


module screew_hole()
{
    translate([0,0,-25])
    cylinder(d=screew_hole_d, h=50,$fn=28);
    translate([0,0,h])
    cylinder(d=screew_hole_d*2, h=20,$fn=28);
}