


s=1;
k = 0.85;

scale([1,1,2.7])
difference()
{
    #horns();
    translate([1,-1,0])    
    rotate([0,0,14])
    scale([k*0.8,k*0.8,k*1.12])
    horns();
//    translate([2,6,1])    
//    scale([1,1.3,1])
//    sphere(d=20);
}


module horns()
{
    scale([2*s,3*s,3.5*s])
    resize(newsize=[11,11,11])
    import("one_horn.stl");
}