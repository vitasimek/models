

w=0.4*2;


difference()
{
    translate([0,0,0])
    cube ([50,11.84,18.16+w]);
    translate([4.255+w,0,w])
    #import_stl("simple_sg90.stl");
}