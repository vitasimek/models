include<dremel_holder_top.scad>
include<dremel_holder_bottom.scad>
include<dremel_table_hole_adapters.scad>

table_width = 200;
table_height = 10;
table_leg_height = body_width;
table_leg_width = 30;
wall = 3;
hole_diameter = 10;
saw_hole_width = 10;
saw_hole_length = 40;
saw_hole_body_shift = 37;
    
table();
translate([0, table_width /2-body_width/2, 0])
body_top_part();


translate([0, table_width /2+body_width/2, body_width + 1])
rotate([180,0,0])
body_bottom_part();
    
saw_hole(saw_hole_width, saw_hole_length, saw_hole_body_shift);

// test
clearance = 0.2;
translate([0,0,-15])
saw_hole_full(saw_hole_width-clearance, saw_hole_length-clearance, saw_hole_body_shift+clearance/2);

module table()
{
    difference()
    {
        union()
        {
            cube([table_width, table_width, table_height]);
            table_legs_pos();
        }
        translate([wall,wall,wall])
        cube([table_width-2*wall, table_width-2*wall, table_height-wall]);

        table_legs_neg();

        translate([0, table_width /2-body_width/2, 0])
        cube([body_length, body_width, table_height]);
        saw_hole_full(saw_hole_width, saw_hole_length, saw_hole_body_shift);
        holes_rows(hole_diameter);
    }
}

module table_legs_pos()
{
    translate([0, 0, 0])
    cube([table_leg_width, table_leg_width, table_leg_height]);
    translate([table_width - table_leg_width, 0, 0])
    cube([table_leg_width, table_leg_width, table_leg_height]);
    translate([0, table_width - table_leg_width, 0])
    cube([table_leg_width, table_leg_width, table_leg_height]);
    translate([table_width - table_leg_width, table_width - table_leg_width, 0])
    cube([table_leg_width, table_leg_width, table_leg_height]);
}

module table_legs_neg()
{
    translate([wall,wall,wall])
    cube([table_leg_width-wall, table_leg_width-wall, table_leg_height--wall]);
    translate([table_width - table_leg_width-wall, wall, wall])
    cube([table_leg_width, table_leg_width, table_leg_height]);
    translate([wall, table_width - table_leg_width-wall, wall])
    cube([table_leg_width, table_leg_width, table_leg_height]);
    translate([table_width - table_leg_width-wall, table_width - table_leg_width-wall, wall])
    cube([table_leg_width, table_leg_width, table_leg_height]);
}

module saw_hole(saw_hole_width, saw_hole_length, saw_hole_body_shift)
{
    translate([body_length + saw_hole_body_shift-2*wall, table_width /2-saw_hole_length/2-2*wall, 0])
    hole_adapter(saw_hole_width+2*wall, saw_hole_length+2*wall, wall);
}

module saw_hole_full(saw_hole_width, saw_hole_length, saw_hole_body_shift)
{
    translate([body_length + saw_hole_body_shift-wall, table_width /2-saw_hole_length/2- wall, 0])
    hole_adapter_case(saw_hole_width, saw_hole_length, wall);
}

module holes_rows(hole_diameter)
{
    holes_row(hole_diameter);
    translate([0, table_width - 2 * hole_diameter, 0])
    holes_row(hole_diameter);
}

module holes_row(hole_diameter)
{
    hole_count = table_width / hole_diameter / 2;
    
    for(i = [0 : hole_count - 1])
    {
        translate([hole_diameter + hole_count * i * 2, hole_diameter, 0])
        hole(hole_diameter);
    }
}

module hole(hole_diameter)
{
    rotate([0,0,45/2])
    cylinder(d=hole_diameter, h=table_height, $fn=8);
}