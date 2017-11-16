
width = 5;

difference()
{
    hull()
    {
        cylinder(d=10, h=width);
        translate([10, 0, 0])
        cylinder(d=6, h=width,$fn=48);
    }

    cylinder(d=8, h=width);
    translate([10, 0, 0])
    cylinder(d=4, h=width,$fn=48);
}