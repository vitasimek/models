fn=8;
//hg=0.2+0.3*3;
hg=0.2+0.3*5;
h=40;
w=0.4*2;
width=200;
x=7;

t=40-hg-4;

use<ring.scad>


//translate([0,0,t*7])
//color("white")
//body();
//translate([0,0,t*6])
//color("hotpink")
//body();
//translate([0,0,t*5])
//color("white")
//body();
//translate([0,0,t*4])
//color("SpringGreen")
//body();
//translate([0,0,t*3])
//color("white")
//body();
//translate([0,0,t*2])
//color("white")
//body();
//translate([0,0,t*1])
//color("white")
//body();
//color("white")
body();

module body()
{
    difference()
    {
        width_i=width-2*w-w;
        union()
        {
            translate([0,0,hg+4+w+2])
            x_cube(width,width,h-hg-4-2,fn);
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
            translate([0,0,hg+h/4])
            x_cube(width,width,h/4*3,fn);
            translate([0,0,hg])
            x_cube(width_i-x,width,h/4,fn);
            x_cube(width_i-x, width_i-x,hg,fn);
        }
    }

    translate([-width/2-w,-width/2-w,0])
    bottom_grid(width);
}


module bottom_grid(width)
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
            bottom_grid_vertical(width=width,c=35*2);
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
