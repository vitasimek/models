module x_cube(width1, width2,h,fn)
{
    width2 = (width2 == 0) ? width1 : width2;

    rotate([0,0,45/2])
    cylinder(d1=width1,d2=width2,h=h,$fn=fn);
}

function side_to_diameter(a) = (
    let(v=a*sin(45))
    let(d=v*2)
    d);

// screew holes:
// distance = 105;
// diagonal distance = 150;
// diameter = 5;