include<dremel_body.scad>

//difference()
//{
//    body_bottom_part();
//
////    translate([0,0,0])
////    cube([55,100,100]);
////    translate([0,0,0])
////    cube([120,60,100]);
//}
    

module body_bottom_part()
{
    difference()
    {
        holder_body(body_width, body_height, body_length);
        translate([0,0,4])
        dremel_tool_body(body_width, body_height, body_length);

        translate([0,0,4])
        translate([0, 0, body_height/2])
        holder_body(body_width, body_height, body_length);
        screew_holes(body_width, body_length);

        translate([body_length/2,body_width/2,body_height/2+4-27/2-2])
        button_hole();
    }
}

module button_hole()
{
    hole_diameter = 17;
    hole_length = 26/2;
    hull()
    {
        translate([-hole_length/2, 0, 0])
        cylinder(d=hole_diameter, h=10);
        translate([hole_length/2, 0, 0])
        cylinder(d=hole_diameter, h=10);
    }
}