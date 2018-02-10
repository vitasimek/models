$fn=28;


function rotation(t) = (t < 0.5)
    ? t * 45 * 4
    : (1-t) * 45 * 4;


difference()
{
    union()
    {
        r = rotation($t);
        rotate([0,0,45+r])
        rudder();
        holders();
    }

    translate([0,0,-10])
    #cylinder(d=4,h=70);
}

module holders()
{
    translate([-20/2,-20/2,-10])
    cube([20,20,5]);
    
    translate([-20/2,-20/2,50+5])
    cube([20,20,5]);
}

module rudder()
{
    hull()
    {
        translate([-1/2,0,5])
        {
            cube([1,40,45]);
            cylinder(d=6,h=45);
        }
    }

    rotator_diameter = 20;
    cylinder(d1=rotator_diameter,d2=rotator_diameter*0.97,h=2);
    translate([0,0,2])
    cylinder(d1=rotator_diameter*0.97,d2=rotator_diameter,h=2);
}