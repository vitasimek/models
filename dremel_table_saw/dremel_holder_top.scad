include<dremel_body.scad>

difference()
{
    body_top_part();

//    translate([0,0,0])
//    cube([55,100,100]);
//    translate([0,0,0])
//    cube([120,60,100]);
}

module body_top_part()
{
    difference()
    {
        holder_body(body_width, body_height, body_length);
        translate([0,0,-4])
        dremel_tool_body(body_width, body_height, body_length);

        translate([0, 0, body_height/2])
        holder_body(body_width, body_height, body_length);
        screew_legs(body_width, body_length);
    }
}

