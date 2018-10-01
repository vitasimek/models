use<ring.scad>

fn=8;
//hg=0.2+0.3*3;
hg=0.2+0.3*5;
h=40;
w=0.4*2;
width=200;

module body(h,c)
{
    stackable_body(width, h, hg, w, fn);

    translate([-width/2-w,-width/2-w,0])
    bottom_grid(width, c);
}


module bottom_grid(width, c)
{
//    difference()
//    {
//        cube([width+2*w,width+2*w,hg]);
//        translate([w,w,0])
//        #cube([width,width,hg]);
//    }

    difference()
    {
        union()
        {
            translate([w,w,0])
            bottom_grid_vertical(width,c);
            translate([w,w,0])
            bottom_grid_horizontal(width=width,c=5,w=w);
        }
        difference()
        {
            cube([width*2,width*2,hg]);
            
            width_i=width-2*w-w-2*w;
            translate([width/2+w,width/2+w,0])
            x_cube(width_i, width_i,hg+4,fn);
        }
    }    
}

module bottom_grid_horizontal(width=width,c=2,w=0.4*2)
{
    s=(width-w*(c-1))/c;
    sw=s+w;
//    echo(s);
    
    translate([0,s,0])
    for(i=[0:c-2])
    {        
        translate([0,i*sw,0])
        cube([width,w,hg]);
    }
}

module bottom_grid_vertical(width=100,c=35,w=0.4*2)
{
    s=(width-w*(c-1))/c;
    sw=s+w;
//    echo(s);

    translate([s,0,0])
    for(i=[0:c-2])
    {        
        translate([i*sw,0,0])
        cube([w,width,hg]);
    }
}
