
w=0.4*3;
di=52;
do=di+3*w;
kf=8;

difference()
{
    outer_tube();
    inner_tube();

}

as_width=40;

module outer_tube()
{
    difference()
    {
        union()
        {
            hull()
            {
                cylinder(d=do,h=110,$fn=28*kf);
                translate([do/2-w,-as_width/2,30])
                cube([10,as_width,50]);
            }
            
            for(j=[-2:2])
            {
                rotate([0,0,j*45])
                translate([-do/2,0,15])
                warts();
            }
        }

        translate([do/2-w,-as_width/2,30])
        translate([w,w,w])
        cube([10,as_width-2*w,50-2*w]);

        translate([do/2,-7/2,70-w])
        cube([5,7,50]);

        translate([0,0,70])
        screew_hole();

        translate([0,0,40])
        screew_hole(d=10);
        
        translate([do/2,-10/2-10,30])
        #cube([3,7,w]);
        translate([do/2,-10/2+10+7/2,30])
        #cube([3,7,w]);
        translate([do/2,-10/2-10,80-w])
        #cube([3,7,w]);
        translate([do/2,-10/2+10+7/2,80-w])
        #cube([3,7,w]);
    }
}

module warts()
{
    for(i=[0:4])
    {
        translate([0,0,i*20])
        scale([1/2,1,1])
        sphere(d=15,$fn=7);
    }
}

module screew_hole(d=5)
{
    translate([di/2-w,0,0])
    rotate([0,90,0])
    #cylinder(d=d,h=10,$fn=7*kf);
}

module inner_tube()
{
    cylinder(d=di,h=110,$fn=28*kf);
}
