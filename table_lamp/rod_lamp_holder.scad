

w=0.4*10;
rod_d=12;
rod_h=50;
holder_h=rod_h;
holder_w=28;

difference()
{
    hull()
    {
        translate([-20,rod_d/2,0])
        lamp_holder();
        rod_holder();
        translate([0,0,holder_h])
        cylinder(d=20,h=20);
    }
    rod();
//    translate([-20,50+11+rod_d/2,20])
    translate([-12,50+11+rod_d/2,7+0])
    #the_holes(gap=20, h=100);
    
    #translate([-20,holder_w/4+8,0])
    cube([40,22-12,holder_h]);
    
    #translate([-20,holder_w/4+8+5,holder_h])
    rotate([0,90,0])
    cylinder(d=10,h=40,$fn=21);
   
}

module the_holes(gap,h=100)
{
    translate([0,0,35])
    the_hole(gap, h);
    translate([25,0,18])
    the_hole(gap, h);
    translate([0,0,0])
    the_hole(gap, h);
}

module the_hole(gap, h=100)
{
    rotate([90,0,0])
    cylinder(d=4,h=h,$fn=21);
    
    translate([0,5,0])
    rotate([90,30,0])
    cylinder(d=8.4,h=(h-gap)/2,$fn=6);
    
    translate([0,(gap-h)/2-gap+1,0])
    rotate([90,30,0])
    cylinder(d=8.4,h=(h-gap)/2,$fn=6);

    translate([0,-h/2+4.5+6.5,0])
    rotate([90,30,0])
    cylinder(d=8.4,h=gap/2+6,$fn=6);
}

module lamp_holder()
{
		cube([40,holder_w,holder_h]);
//		translate([0,6,0])
//		cube([40,holder_w-12,holder_h]);
//		translate([7,holder_w+6,5])
//		rotate([90,30,0])
//		cylinder(d=3,h=34,$fn=21);
}

module rod_holder()
{
    $fn=77;
    cylinder(d=rod_d+2*w,h=rod_h);
}

module rod()
{
    $fn=77;
    translate([0,0,-rod_h*1])
    cylinder(d=rod_d, h= rod_h*3);
}