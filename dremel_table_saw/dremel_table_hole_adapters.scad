include<dremel_body.scad>

wall = 0.8;
table_height = 10;


//adapter_clearance = 0;
adapter_width = 20;
adapter_length = 40;



module hole_adapter(adapter_width, adapter_length, wall)
{
    difference()
    {
        hole_adapter_case(adapter_width, adapter_length, wall);
        translate([wall, wall, 0])
        hole_adapter_case(adapter_width, adapter_length);
    }
}

module hole_adapter_case(adapter_width, adapter_length, wall=0)
{
    adapter_height_third = table_height / 3;
    
    hull()
    {
        cube ([adapter_width+2*wall, adapter_length+2*wall, adapter_height_third]);

        translate([adapter_height_third, adapter_height_third, adapter_height_third])
        cube ([adapter_width-2*adapter_height_third+2*wall, adapter_length+2*wall-2*adapter_height_third, adapter_height_third]);
    }
        translate([adapter_height_third,adapter_height_third,2*adapter_height_third])
        cube ([adapter_width+2*wall-2*adapter_height_third, adapter_length+2*wall-2*adapter_height_third, adapter_height_third]);
}