//$fn=21;

height=10;
sphere_d=15;

difference()
{
        union()
        {
            cylinder(d=4,h=height*2,$fn=21);
            translate([0,0,0])
            spiral(0);

            #translate([-0.4,6.4,0])
            cube([0.8,10,height]);
        }

//    
//    cylinder(d=0.4*10-4*0.4,h=height,$fn=21);
}
f=3.5;

function xxx(r, thickness, t) = [(r-thickness+t/90/f)*sin(t),(r-thickness+t/90/f)*cos(t)];
function yyy(r, thickness, t) = [(r+t/90/f)*sin(t),(r+t/90/f)*cos(t)];


module spiral(x=0)
{
    r=1.5;
    thickness=0.4*2;
    loops=5;
    points = concat(
        [for(t = [90:1:(360+x)*loops]) 
            xxx(r,thickness,t)],
        [for(t = [(360+x)*loops:-1:90]) 
            yyy(r,0,t)]);
    
    linear_extrude(height=height)    
    polygon(points=points);
}