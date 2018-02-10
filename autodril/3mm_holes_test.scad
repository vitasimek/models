

w=1.2;

difference()
{
    cube([10,30,10]);
    for(i=[1:5])
    {
        d = 3-(i*0.1/2);
        echo(d);
        translate([5,i*5,0])
        #cylinder(d=d,h=10,$fn=28);
    }
}