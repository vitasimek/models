module stackable_body(width, h, hg, w, fn)
{
    x=7;

    difference()
    {
        width_i=width-2*w-w;
        union()
        {
            translate([0,0,hg+4+w+2])
            x_cube(width,width,h-hg-4-2-w,fn);
            translate([0,0,hg+4+w])
            x_cube(width_i+w,width,2,fn);
            translate([0,0,hg+4])
            x_cube(width_i, width_i+w,w,fn);
            translate([0,0,hg])
            x_cube(width_i, width_i,4,fn);
            x_cube(width_i-2*w, width_i,hg,fn);
        }
        translate([0,-50*0,0])
        {
            width=width-2*w;
            width_i=width_i-2*w;
            translate([0,0,hg+hg+4+w+2])
            x_cube(width,width,h-(hg+4+w+2),fn);
            translate([0,0,hg])
            x_cube(width_i-x,width,(hg+4+w+2),fn);
            x_cube(width_i-x, width_i-x,hg,fn);
        }
    }
}


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