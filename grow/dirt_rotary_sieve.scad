


w=0.4*10;
d=100-w;
h=200;

xxx(d,d);

module xxx(d1,d2)
{
    difference()
    {
        //$fn=177;
        cylinder(d1=d1+2*w, d2=d2+2*w,h=h);
        cylinder(d1=d1, d2=d2,h=h);
        //holes(dh=10, c=7.5, ch=7);
//        holes(dh=3, c=3, ch=19);
        holes(dh=5, c=5, ch=2);
    }
        translate([0,0,-5])
        #cylinder(d1=d1+2*w, d2=d2+2*w,h=w);
}


module holes(dh,c, ch)
{
    //c = 7.5;
    x = 360 / c;
    for(j = [0:x])
    {
        rotate([0,0,j*c])
        hole_row(dh,j, ch);
    }
}

module hole_row(dh, j, ch)
{
    dhw = dh+2;
    for(i = [1:ch])
    {
        z_offset = j % 2 ? 0 : dhw;
        translate([0,0,i*dhw*2+z_offset])
        hole(dh);        
    }
}

module hole(dh)
{
    translate([0,d/2-0.4*1,0])
    rotate([-90,90,0])
    #cylinder(d1=dh, d2=dh*1.5, h=1.1*w, $fn=6);
}