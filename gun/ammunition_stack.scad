

w=0.4*3;
c=0.5;

//translate([40,0,0])
//rotate([90,-90,0])
//{
//    difference()
//    {
//        cube([30,40-2*w-c,50-2*w-c]);
//        translate([w,w,w])
//        cube([30,40-4*w-c,50-4*w-c]);
//        translate([w+5,(40-2*w-c)/2-w/2,0])
//        cube([20-w,w,w]);
//        translate([w+5,(40-2*w-c)/2-w/2,50-4*w-c+w])
//        cube([20-w,w,w]);
//    }
//}


w=0.4*3;

difference()
{
    union()
    {
        stack(-w);
        clips();
    }
    translate([0,0,0])
    scale([1,1,1.1])
    stack(-2*w);

    translate([40/2-5,0,31])
    cube([10,50,5]);
    
//    #clip_spring();
//    translate([23+w/2,0,0])
//    #clip_spring();
}

module clip_spring()
{
    translate([5,0,26])
    cube([w/2,50,10]);
    translate([5+5,0,26])
    cube([w/2,50,10]);
}

module stack(w=0)
{
    translate([-w,-w,-w])
    hull()
    {
        d=27;
        width=40+2*w;
        length=50+2*w;
        height=35+2*w;
        
        corner_plane(d,width,length,height);
        
        translate([0,0,height-3/2])
        corner_plane(3,width,length,height);
        //cube([width,length,1]);

    }
}

module corner_plane(d,width,length,height)
{
    translate([0,0,0])
    corner_sphere(d);
    translate([width-d,0,0])
    corner_sphere(d);
    translate([0,length-d,0])
    corner_sphere(d);
    translate([width-d,length-d,0])
    corner_sphere(d);
}

module corner_sphere(d)
{
    s=1.15;
    
    translate([d/2,d/2,d/2])
    rotate([0,0,45/2])
    scale([s,s,s])
    sphere(d=d,$fn=8);
}

module clips()
{
    translate([5-w/2,0,30])
    rotate([0,-90,-90])
    {
        translate([0,0,0])
        clip();
        translate([0,20+7/2,0])
        clip();
        translate([0,0,50-w*5/2])
        clip();
        translate([0,20+7/2,50-w*5/2])
        clip();
    }
}

module clip()
{
    //#cube([3,7,w]);
    translate([5*w/2,1,w*4/3])
    rotate([-90,0,0])
    cylinder(d=3,h=5,$fn=4);
}


