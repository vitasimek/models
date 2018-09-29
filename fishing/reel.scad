$fn=21*4;

w=0.4*4*2;
do=70;
dr=45;
di=do-2*w;
hb=3.5;
hh=15;
hr=15;
d=do;
c=0.4;


//translate([0,0,20])
//translate([0,0,hb+hh+hb])
//float();
//translate([0,0,40])
//translate([0,0,hb+hh+hb])
//cup();
//reel();


//rotate([0,180,0])
//float();


//rotate([0,180,0])
//cup();

reel();


module float()
{
    dfi=di-2*w-2*c;
    dfr=(dr-2*w)/2;
    
    difference()
    {
        union()
        {
            translate([0,0,hr+hr+hb-c])
            cylinder(d1=dfi,d2=dfr*3/2,h=hr*3/4);    
            translate([0,0,hr+hr])
            cylinder(d=dfi,h=hb-c);    
            translate([0,0,c])
            cylinder(d1=dfr,d2=dfi,h=hr+hr-c);    
        }

        translate([0,0,(hb+hr+hr-c++hr*3/4)/2])
        #cylinder(d1=2.2,d2=2.5,h=(hb+hr+hr-c++hr*3/4)/2);    
        #cylinder(d1=2.5,d2=2.2,h=(hb+hr+hr-c++hr*3/4)/2);    

//        translate([0,do/2,50])
//        cube([do,do,100],center=true);
    }
}

module cup()
{
    difference()
    {
        union()
        {
            cylinder(d=do,h=hb+hr+hr+w+c);
        }
        translate([0,0,hr+hr+w+c])
        #cylinder(d1=di-2*w,d2=di-2*w-2*w-w+c,h=hb);
        translate([0,0,0])
        #cylinder(d=di,h=hr+hr+w+c);
        
//        translate([0,do/2,50])
//        cube([do,do,100],center=true);
    }

    translate([di/2,0,hb/2])
    scale([1/2,1,1])
    sphere(d=hb,$fn=21);
    translate([-di/2,0,hb/2])
    scale([1/2,1,1])
    sphere(d=hb,$fn=21);
}

module reel()
{
    di=di-c;
    difference()
    {
        union()
        {
            translate([0,0,hb+hh+hb+hr+hr])
            cylinder(d=di,h=w);
            translate([0,0,hb+hh+hb+hr])
            cylinder(d1=dr,d2=di,h=hr);
            translate([0,0,hb+hh+hb])
            cylinder(d=dr,h=hr);
            translate([0,0,hb+hh+hb])
            cylinder(d=di,h=hb);
            translate([0,0,hb+hh])
            cylinder(d=do,h=hb);
            cylinder(d=do,h=hb+hh);
        }

        translate([0,0,hb+hh+hb+hr+hr])
        cylinder(d=di-2*w,h=w);
        translate([0,0,hb+hh+hb+hr])
        cylinder(d1=dr-2*w,d2=di-2*w,h=hr);
        translate([0,0,hb+hh+hb])
        cylinder(d=dr-2*w,h=hr);
        translate([di/2,0,hb/2+hb+hh+hb])
        scale([1/2,1,1])
        sphere(d=hb,$fn=21);
        translate([-di/2,0,hb/2+hb+hh+hb])
        scale([1/2,1,1])
        sphere(d=hb,$fn=21);
        hand_hole(do-2*w);
        
        rotate([0,0,10])
        translate([dr/2-w,0,w/2+hb+hr+hr/2])
        rotate([0,90,0])
        cylinder(d=w,h=w);
        rotate([0,0,-10])
        translate([dr/2-w,0,w/2+hb+hr+hr/2])
        rotate([0,90,0])
        cylinder(d=w,h=w);
        
        #cylinder(d=10,h=100,$fn=6);
        
//        translate([0,do/2,50])
//        cube([do,do,100],center=true);
    }
}

module hand_hole(d)
{

    translate([0,0,hb])
    cylinder(d=d,h=hh);

    difference()
    {
        cylinder(d=d,h=hb);
        translate([d/2,0,hb/2])
        cube([d,d,hb],center=true);
    }
}