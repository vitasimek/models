$fn = 49;

body_width = 35;
body_height = 31;
body_length = 110;
screew_head_diameter = 8.2;
screew_neck_diameter = 3;
screew_leg_diameter = 3;
screew_head_dilatation = 1;
screew_head_height = 3;
screew_hole_shift = 1;



module dremel_tool_body(body_width, body_height, body_length)
{
    part_length = body_length / 4;
    
    translate([0, body_width/2, body_height/2])
    rotate([0, 90,0])
    {
        translate([0,0,0*part_length])
        cylinder(d1=17, d2=25, h=part_length);
        translate([0,0,1*part_length])
        cylinder(d1=25, d2=27, h=part_length);
        translate([0,0,2*part_length])
        cylinder(d1=27, d2=25, h=part_length);
        translate([0,0,3*part_length])
        cylinder(d1=25, d2=17, h=part_length);
    }
}

module holder_body(body_width, body_height, body_length)
{    
    cube([body_length, body_width, body_height]);
}

module screew_holes(body_width, body_length)
{
    translate([5,5,0])
    screew_hole(body_height);
    translate([5,body_width-5,0])
    screew_hole(body_height);
    translate([body_length-5,5,0])
    screew_hole(body_height);
    translate([body_length-5,body_width-5,0])
    screew_hole(body_height);
}

module screew_legs(body_width)
{
    translate([5,5,0])
    screew_leg(body_width, screew_hole_shift);
    translate([5,body_width-5,0])
    screew_leg(body_width, screew_hole_shift);
    translate([body_length-5,5,0])
    screew_leg(body_width, screew_hole_shift);
    translate([body_length-5,body_width-5,0])
    screew_leg(body_width, screew_hole_shift);
}

//translate([-20,-20,0])
//screew_hole(body_height);

module screew_hole(body_height)
{
    screew_leg(body_height, screew_hole_shift);
//    cylinder(d=screew_head_diameter,h=screew_hole_shift);
    translate([0,0,0])
    cylinder(d1=screew_head_diameter,d2=screew_neck_diameter,h=screew_head_dilatation+screew_head_height);
}

module screew_leg(body_width, screew_hole_shift)
{
    cylinder(d=screew_leg_diameter,h=body_width+screew_hole_shift);
}
