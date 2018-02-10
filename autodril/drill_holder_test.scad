
fn=77;

difference()
{
    xxx(0.4*2);
    xxx();
    translate([0,0,-35])
    cube([0.4,30,40]);
    translate([-7,0,-10])
    cube([14,30,11]);
}

module xxx(w=0)
{
    //c=3;//1.6;
    w=2*w;
    rotate([0,180,0])
    hull()
    {
        cylinder(d1=27+w,d2=37+w-0.32,h=10,$fn=fn);
        scale([(33.4)/(37),1,1])
        {
            translate([0,0,10])
            cylinder(d1=37+w-0.32,d2=35.5+2+w,h=20,$fn=fn);
        }
    }
}
