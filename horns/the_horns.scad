




//linear_extrude(100)
for(i=[0:21])
{
    s = 1/i*10;
    scale([1,1,0.3])
    rotate([0,0,i*15])
    translate([0,5-i/5,i*5/2])
    //scale([s,s,s])
    sphere(d=4+1/i*5,$fn=28);
}