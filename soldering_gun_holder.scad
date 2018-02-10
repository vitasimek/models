sphere_fn=14;

wall=0.4*4;
inner_width=60;
inner_length=70;
inner_height=90;
outer_width=2*wall+inner_width;
outer_length=2*wall+inner_length;
outer_height=2*wall+inner_height;



difference()
{
    union()
    hull()
    {
        round_cube(outer_width,2*wall+inner_length,2*wall+inner_height);
        translate([0,10,20])
        screew_mounting();
        translate([0,-10,70])
        screew_mounting();
    }
    translate([wall,wall,wall])
    round_cube(inner_width,inner_length,inner_height+10);

    translate([outer_width/2-35/2,outer_length-25/4,25])
    cube([35,10,80]);

    translate([outer_width/2-25/2,outer_length/2-45/2,0])
    cube([25,45,2*wall]);
    
    translate([0,10,20])
    screew_mounting_hole(4);
    translate([0,-10,70])
    screew_mounting_hole(4);
    
    translate([8,10,20])
    #screew_mounting_head_hole(4);
    translate([8,-10,70])
    #screew_mounting_head_hole(4);

    translate([0,10,20])
    #screew_mounting_screewing_hole(14);
    translate([0,-10,70])
    #screew_mounting_screewing_hole(14);
}


module screew_mounting()
{
    translate([outer_width,outer_length/2,0])
    rotate([0,90,0,])
    cylinder(d=40,h=4);
}

module screew_mounting_hole(d)
{
    translate([outer_width-20/2,outer_length/2,0])
    rotate([0,90,0,])
    cylinder(d=d,h=20,$fn=sphere_fn);
}

module screew_mounting_head_hole(d)
{
    translate([outer_width-20/2,outer_length/2,0])
    rotate([0,90,0,])
    cylinder(d1=d*3,d2=d,h=4,$fn=sphere_fn);
}

module screew_mounting_screewing_hole(d)
{
    translate([-20/2,outer_length/2,0])
    rotate([0,90,0,])
    cylinder(d=d,h=20,$fn=6);
}

module round_cube(width,length,height)
{
    sphere_d=5;
    shift=sphere_d/2;

    translate([shift,shift,shift])
    hull()
    {
        translate([0,0,0])
        sphere(d=5,$fn=sphere_fn);
        translate([width-sphere_d,0,0])
        sphere(d=5,$fn=sphere_fn);
        translate([width-sphere_d,length-sphere_d,0])
        sphere(d=5,$fn=sphere_fn);
        translate([0,length-sphere_d,0])
        sphere(d=5,$fn=sphere_fn);

        translate([0,0,height-sphere_d])
        sphere(d=5,$fn=sphere_fn);
        translate([width-sphere_d,0,height-sphere_d])
        sphere(d=5,$fn=sphere_fn);
        translate([width-sphere_d,length-sphere_d,height-sphere_d])
        sphere(d=5,$fn=sphere_fn);
        translate([0,length-sphere_d,height-sphere_d])
        sphere(d=5,$fn=sphere_fn);
    }
}