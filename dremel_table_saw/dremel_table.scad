include<dremel_holder_top.scad>
include<dremel_holder_bottom.scad>
include<dremel_table_hole_adapters.scad>

table_width = 200;
table_height = 10;
table_leg_height = 45;
table_leg_width = 30;
wall = 3;
hole_diameter = 10;
saw_hole_width = 10;
saw_hole_length = 50;
saw_hole_body_shift = -saw_hole_width/2+39;

difference()
{
    whole_table();

// TODO: Remove this after test print !!
    difference()
    {
        cube([300, 300, 50]);
        translate([85, 60, 0])
        cube([85, 80, 50]);
    }
}

    clearance = 0.2;

// TODO: Remove this after test print !!
    translate([-80,0,0])
    saw_hole_full(saw_hole_width-clearance, saw_hole_length-clearance, saw_hole_body_shift+clearance/2);


module whole_table()
{
    table();
    translate([0, table_width /2-body_width/2, 0])
    body_top_part();

    //translate([0, table_width /2+body_width/2, body_width + 1])
    translate([0, table_width+2, 0])
    //rotate([180,0,0])
    body_bottom_part();
        
    saw_hole(saw_hole_width, saw_hole_length, saw_hole_body_shift);

    // test
    clearance = 0.2;

    translate([62,0,0])
    saw_hole_full(saw_hole_width-clearance, saw_hole_length-clearance, saw_hole_body_shift+clearance/2);
}

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
        saw_hole_full(saw_hole_width, saw_hole_length, saw_hole_body_shift,0);
        holes_rows(hole_diameter);
        tiny_screew_holes();
    }
}

module tiny_screew_holes()
{
    tiny_hole_count = 7;
    tiny_hole_distance = 25;    

    tiny_hole_shift = 25;
    echo(tiny_hole_shift);
    
    for(i = [0 : tiny_hole_count - 1])
    for(j = [0 : tiny_hole_count - 1])
    {
        translate([tiny_hole_shift+tiny_hole_distance*i,tiny_hole_shift+tiny_hole_distance*j,0])
        cylinder(d=1.9,h=wall, $fn=21);
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
    difference()
    {
        hole_adapter(saw_hole_width+2*wall, saw_hole_length+2*wall, wall);
        saw_hole_rod_space(saw_hole_width+2*wall, saw_hole_length+2*wall, saw_hole_body_shift, wall);
    }    
}

module saw_hole_full(saw_hole_width, saw_hole_length, saw_hole_body_shift, clear=1)
{
    translate([body_length + saw_hole_body_shift-wall, table_width /2-saw_hole_length/2- wall, 0])
    difference()
    {
        hole_adapter_case(saw_hole_width, saw_hole_length, wall);
        translate([saw_hole_width/2+wall/3*2,wall,0])
        cube([2,saw_hole_length, table_height*clear]);

        saw_hole_rod_space(saw_hole_width, saw_hole_length, saw_hole_body_shift, wall);
    }
}

module saw_hole_rod_space(saw_hole_width, saw_hole_length, saw_hole_body_shift, wall)
{
    translate([0,saw_hole_length/2+wall,table_height])
    rotate([0,90,0])
    cylinder(d=table_height*1.3, h=saw_hole_width+2*wall);
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