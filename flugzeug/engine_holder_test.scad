$fn = 74;

engine_d = 7;
engine_l = 20;
engine_wall = 0.4*2;



difference()
{
    engine_holder(engine_d, engine_l*2, engine_wall);
    translate([0, engine_d/2 + engine_wall, engine_wall])
    engine_body(engine_d, engine_l, engine_wall, 20);
}

module engine_holder(width, length, wall)
{
    //rotate([0, 0,0])
    cube([length, width+2*engine_wall, width]);
}

module engine_body(engine_d, engine_l, engine_wall, tail = engine_wall)
{
    translate([0,0,engine_d/2])
    rotate([0, 90,0])
    {
        cube_cylinder(engine_d - 2*engine_wall, engine_wall);
        translate([0,0, engine_wall])
        cube_cylinder(engine_d, engine_l);
        translate([0,0, engine_wall+engine_l])
        cube_cylinder(engine_d - 2*engine_wall, tail);
    }
}

module cube_cylinder(d, l)
{
    cylinder(d = d, h = l);
    translate([-d/2, -d/2, 0])
    cube([d/2, d, l]);
}


//    cube_width = engine_d + 2*engine_wall;

//        translate([-cube_width/2, -cube_width/2, 0])
//        cube([cube_width, cube_width, engine_l]);
