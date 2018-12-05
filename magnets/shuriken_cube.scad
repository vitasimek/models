


s=0.20;


c=0.05;
a=5.1+c;


difference()
{
    scale([s,s,s])
    import("screw_big.stl");
    translate([-a/2,-a/2,22])
    #cube([a,a,a*2]);
}