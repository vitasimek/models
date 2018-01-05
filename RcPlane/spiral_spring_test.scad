

height=10;

difference()
{
    union()
    {
        translate([0,0,0])
        spiral(+45/2);
        translate([0,0,0])
        rotate([0,0,180])
        spiral();

        cylinder(d=0.4*10,h=height,$fn=21);

        rotate([0,0,-45])
        #translate([-0.4,8+0.2+0.5,0])
        cube([0.8,10,height]);
        translate([-0.4,-8-0.2-10,0])
        cube([0.8,10,height]);
    }
    
    cylinder(d=0.4*10-4*0.4,h=height,$fn=21);
}


module spiral(x=0)
{
    r=1;
    thickness=0.4*2;
    loops=2;
    linear_extrude(height=height)
    polygon(points= concat(
        [for(t = [90:(360+x)*loops]) 
            [(r-thickness+t/90)*sin(t),(r-thickness+t/90)*cos(t)]],
        [for(t = [(360+x)*loops:-1:90]) 
            [(r+t/90)*sin(t),(r+t/90)*cos(t)]]
            ));
}