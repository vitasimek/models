$fn=77;
use <parametric_NACA4_library.scad>;

length = 20;

fuselage_diameter=50+20;
tail_rod_length = 500;


servo_width = 11.84;
    translate([-servo_width*0,40,-22])
    rotate([0,0,-90])
    import("simple_sg90.stl");
    translate([-servo_width*1,40,-22])
    rotate([0,0,-90])
    import("simple_sg90.stl");


module wing_section(length, basewidth = 150)
{
    straight_wing(length, basewidth);
}

#difference()
{
    union()
    {
        fuselage(length = 150, diameter=fuselage_diameter);
        tail(tail_rod_length, fuselage_length = 150);
        wing_left();
        wing_right();
    }

    fuselage_neg(length = 150, diameter=fuselage_diameter);
    tail_neg(tal_rod_length = tail_rod_length, fuselage_length = 150);
}
    

module wing_left(wing_anchor_span_width = 20, wing_anchor_span_shift = 18)
{
    translate([wing_anchor_span_width/2+10,0,wing_anchor_span_shift])
    wing_section(210);
    translate([wing_anchor_span_width+210+20,0,wing_anchor_span_shift])
    wing_section(210);
}

module wing_right(wing_anchor_span_width = 20, wing_anchor_span_shift = 18)
{
    translate([-wing_anchor_span_width/2-210-10,0,wing_anchor_span_shift])
    wing_section(210);
    translate([-wing_anchor_span_width-210*2-20,0,wing_anchor_span_shift])
    wing_section(210);
}

module fuselage(length = 150, diameter=50)
{
    difference()
    {
        hull()
        {
            wing_anchor_span();

            translate([0,-length/3*2,0])
            scale([1,1.68,1])
            sphere(d=diameter);

            translate([0,length/3*2+100,0])
            scale([1,1.68,1])
            sphere(d=diameter/2);
        }
        wing_anchor_span_neg();
    }
}

module fuselage_neg(length = 150, diameter=50)
{
    #tail_rod(tail_rod_length, fuselage_length = length);
}

module tail_rod(length = 500, fuselage_length)
{
    translate([0, fuselage_length/2,0])
    rotate([-90,0,0])
    cylinder(d=8, h=length);
}

module tail(tail_rod_length = 500, fuselage_length)
{
    translate([-0, fuselage_length/2,0])
    translate([0, tail_rod_length, 0])
    {
//        translate([-20, -5, -7])
//        wing_section(40, 100);
        translate([20+5, -5, -7])
        wing_section(100, 100);
        translate([-100-20-5, -5, -7])
        wing_section(100, 100);

        translate([-1,0,30])
        cube([2,70,100]);

        hull()
        {
//            translate([0, -30, 0])
//            sphere(d=15);
//            translate([0, 10, 9])
//            sphere(d=25);
        }
    }
}

module tail_neg(tail_rod_length = 500, fuselage_length)
{
    diameter = 4;
    translate([110, fuselage_length/2,0])
    translate([0, tail_rod_length, 00])
    rotate([0,-90,0])
    #cylinder(d=diameter, h=220);
}

module wing_anchor_span(wing_anchor_span_width = 20, wing_anchor_span_shift = 18)
{
    translate([-wing_anchor_span_width/2,0,wing_anchor_span_shift])
    wing_section(wing_anchor_span_width);
}

module wing_anchor_span_neg(wing_anchor_span_width = 20, wing_anchor_span_shift = 18)
{
        translate([-wing_anchor_span_width*3/2,0,18])
        wing_section(wing_anchor_span_width);
        translate([wing_anchor_span_width/2,0,18])
        wing_section(wing_anchor_span_width);
    
        #wing_anchor_rods();
}

module wing_anchor_rods(diameter = 4, length = 420*2, wing_anchor_span_shift = 18)
{
    basewidth = 150;

    translate([length/2, -basewidth/7,wing_anchor_span_shift/2*3])
    rotate([0,-90,0])
    cylinder(d=diameter, h=length);

    translate([length/2, basewidth/7,wing_anchor_span_shift/2*3])
    rotate([0,-90,0])
    cylinder(d=diameter, h=length);
}