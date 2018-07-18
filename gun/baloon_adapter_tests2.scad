$fn=14*10;

w=0.4*2;
h=41;
do=50.5;

outer_ring(h);

module outer_ring(h)
{
    difference()
    {
        union()
        {
            translate([0,0,h])
            cylinder(d1=do,d2=do-2,h=2);
            cylinder(d=do,h=h);
        }
        inner_hole(do-20,h=h,doo=do-4*w);
        cylinder_quarter(d=do-20-4*w,a=2);
    }
}

translate([40,0,-30])
!inner_ring(do-20-w/4,30);

module inner_ring(do,h)
{
    dj=do-4*w;
    di=do-4*w-4;
    
    translate([0,0,-h])
    difference()
    {
        cylinder(d=dj,h=h);    
        #cylinder(d1=dj-4*w,d2=di-4*w,h=h);            
    }
    
    translate([0,0,0.35*6])
    difference()
    {
        union()
        {
            translate([0,0,-0.35*6])
            cylinder(d=di,h=0.35*6);    
            inner_hole(do,h=11,doo=di);
        }
        //rotate([0,0,90])
        translate([0,0,2])
        difference()
        {
            cylinder_quarter(d=dj,a=0);
            cylinder_quarter(d=di,a=0);
        }

        translate([0,0,-0.35*6])
        cylinder(d=di-4*w,h=h+2);
    }
}

//rotate([0,0,180-25/2])
//#ring_slide(d=do-4*w-w);


//translate([0,0,-60])
//cylinder_quarter(d=do-4*w,a=2);

module inner_hole(do,h,doo)
{
    dj=do-4*w;
    di=do-4*w-4;
    difference()
    {
        union()
        {
            translate([0,0,2+2+5+2])
            cylinder(d1=di,d2=doo,h=h-(2+2+5));
//            #cylinder(d=di,h=h-(2+2+5));
            translate([0,0,2+2+5])
            cylinder(d1=dj,d2=di,h=2);
            translate([0,0,2+2])
            cylinder(d=dj,h=5);
            translate([0,0,2])
            cylinder(d1=di,d2=dj,h=2);
            cylinder(d=di,h=2);
        }
        rotate([0,0,-1])
        ring_lock(d=do-4*w-w);
        rotate([0,0,-25])
        ring_lock(d=do-4*w-w);
        rotate([0,0,180-1])
        ring_lock(d=do-4*w-w);
        rotate([0,0,180-25])
        ring_lock(d=do-4*w-w);
    }
}

module cylinder_quarter(d,a=0)
{
    h=9;
    
    rotate([0,0,-a])
    rotate_extrude(angle=90+a*2,convexity=1)
    square([d/2,h]);

    rotate([0,0,180-a])
    rotate_extrude(angle=90+a*2,convexity=1)
    square([d/2,h]);
    
}

module ring_lock(d)
{
    h=9;
    translate([d/2+w,0,2+2+5/2])
    scale([0.5,1,1])
    rotate([0,0,45/2])
    sphere(d=5,$fn=8);
}

module ring_slide(d)
{
    ring_lock(d=d);
    
    rotate([0,0,25/2+2])
    rotate_extrude(angle=180-45/2-25/2-2)
    translate([d/2+w,2+2+5/2,0])
    scale([0.5,1,1])    
    rotate([0,0,45/2])
    circle(d=5,$fn=8);
    
//        rotate([0,0,180-25/2])
//        #ring_lock(d=do-4*w-w);
//
//        rotate([0,0,90-25/2])
//        #ring_slide(d=do-4*w-w);
//        rotate([0,0,270-25/2])
//        #ring_slide(d=do-4*w-w);

//            #ring_lock(d=do-4*w-w);

}