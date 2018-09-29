$fn=77;
//$fn=28;

wall = 0.8;
//diameter = 9;
diameter = 5;
outer_diameter = 35.3;
//row_count=17;
row_count=35/6*5;
echo(row_count*diameter);


dildo_shape(diameter, wall);
translate([-20, -30, 0])
#testicle();
translate([20, -30, 0])
#testicle();

module testicle(d=60)
{
    difference()
    {
        translate([0,0,d/3])
        sphere(d=d);
        translate([0,0,-d/4])
        cube([d,d,d/2],center=true);
    }
}

module dildo_shape(diameter, wall = 0)
{
    outer_diameter = outer_diameter+2*wall;
    translate([0,0,row_count*(diameter)])
    scale([1,1,1.6180339887])
    sphere(d=outer_diameter);
    cylinder(d=outer_diameter, h=row_count*(diameter));
}


module holes_around()
{
    for(up = [1:row_count])
    for(rotation = [0:15: 360])
    {
        odd_shift = (up % 2 == 0) ? 0 : row_count*15;
        
        translate([0,0,up*diameter ])
        rotate([90, 30, rotation*2+odd_shift])
        translate([0,0,outer_diameter/2-wall])
        cylinder(d=diameter/2+(diameter/2.1/row_count*up), h=3*wall,$fn=6);
    }
}