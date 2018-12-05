use<ring.scad>

fn=8;
//hg=0.2+0.3*3;
hg=0.2+0.3*5;
h=70;
w=0.4*2;
width=200;
x=7;

t=40-hg-4;




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
            translate([0,0,hg])
            x_cube(width, width,h,fn);
            x_cube(width, width,hg,fn);
        }
        translate([0,-50*0,0])
        {
            width=width-2*w;
            width_i=width_i-2*w;
            translate([0,0,hg+h-10])
            x_cube(width,width,10,fn);
            translate([0,0,hg])
            x_cube(width_i-x,width,h-10,fn);
            x_cube(width_i-2*x, width_i-x,hg,fn);
        }
		for(i = [0:7])
		rotate([0,0,45*i+45/2])
        #frameRibHoles(h, width);
    }

//    translate([-width/2-w,-width/2-w,0])
//    bottom_grid(width);
}


module frameRibHoles(height, diameter)
{
	holeCount = 5;
	holeWidth = 7;
	holeSpacing = 13.75;

	translate([-diameter/2,0,height*0.85])
	rotate([0,90,45/2])
	for(holeIndex = [1:holeCount])
	hull()
	{
		translate([0,(holeSpacing/holeCount)-holeSpacing*holeIndex,0])
		#cylinder(d=holeWidth,h=x,$fn=fn);
		translate([h*0.7,(holeSpacing/holeCount)-holeSpacing*holeIndex,0])
		cylinder(d=holeWidth,h=x,$fn=fn);
	}
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

//module x_cube(width1, width2,h)
//{
//    width2 = (width2 == 0) ? width1 : width2;
//
//    rotate([0,0,45/2])
//    cylinder(d1=width1,d2=width2,h=h,$fn=fn);
//}
//
//function side_to_diameter(a) = (
//    let(v=a*sin(45))
//    let(d=v*2)
//    d);
//
////module side_vertical_span(h, d=10)
////{
////    scale([1,1/2,1])
////    difference()
////    {
////        cylinder(d1=d,d2=d/5,h=h,$fn=6);
////        translate([-d/2,-d/2,0])
////        cube([d,d/2,h]);
////    }
////}
//
//// screew holes:
//// distance = 105;
//// diagonal distance = 150;
//// diameter = 5;