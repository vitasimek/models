
$fn=8*14;

tube(d=50.5);
tube(d=20);
tube(d=25);
tube(d=30);

module tube(d)
{
    w=-2*0.4;
    h=40;
    difference()
    {
        cylinder(d=d,h=h);
        cylinder(d=d+2*w,h=h);
    }
}