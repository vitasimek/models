

i_d = 16;
o_d = 25;
o_shift = 3;
wall = 1;
height = 20;

difference()
{
    translate([0,0,o_d*4/9])
    sphere(d=o_d);
    
    translate([-o_d/2,-o_d/2,-o_d*1/9])
    cube([o_d,o_d,o_d*1/9]);
   
    translate([0,0,o_d-20-o_d*1/9*0.8])
    cylinder(d=i_d, h=20*1.1);    

    cut();
}

translate([0,0,-5])
rod(0);
translate([5,0,-4])
rod(-10);
translate([10,0,-2])
rod(-20);

module cut()
{
    translate([-25, 0, -20])
    cube([50, 50, 100]);
}

module rod(angle=0)
{
    rotate([0,angle,0])
    cylinder(d=2, h=10);
}