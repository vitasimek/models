
use<ir_receiver_pcb.scad>;

width = 60;
length = 44;
height = 65;

w=0.4*3;
h=10-w;
d=3.5;

// TODO: U KRABIČKY NEZAPOMENOUT NA USB PORT, ABY BYLO MOŽNÉ VYČÍTAT DATA.

translate([-w,-w,0])
difference()
{
    cube([width+2*w,length+2*w,height]);
    translate([w,w,0])
    cube([width,length,height]);
    
    translate([0,length/2+w,height-20])
    rotate([0,90,0])
    #cylinder(d=10,h=w,$fn=6);
    
    translate([width+w,length/2+w,height-20])
    rotate([0,90,0])
    #cylinder(d=10,h=w,$fn=6);
}    

bottom_side(width,length,w);

module bottom_side(width,length,w)
{
    difference()
    {
        cube([width,length,w]);
        translate([2,-25/2,0])
        button_holes();

        rotate([180,0,0])
        translate([(width/2-(width-4)/2),-(length-2)-2,-receiver_pcb_height_total()+1])
        receiver_pcb();
    }
    translate([2,-25/2,w])
    buttons();

    translate([7+2,6.5,0])
    spacers();
}

module buttons()
{
    translate([4,25,0])
    button();
    translate([14,25,0])
    button();
    translate([24,25,0])
    button();
}

module button()
{
    translate([6.5/2,6.5/2,0])
    cylinder(d=4,h=3.9,$fn=21);
}

module button_holes()
{
    translate([4,25,0])
    button_hole();
    translate([14,25,0])
    button_hole();
    translate([24,25,0])
    button_hole();
}

module button_hole()
{
    difference()
    {    
        union()
        {
            translate([6.5/2-2,6,0])
            cube([4,10,w]);
            translate([6.5/2,6.5/2,0])
            cylinder(d=8,h=w,$fn=21);    
        }
        translate([6.5/2-2+1/2,6,0])
        cube([3,10,w]);
        translate([6.5/2,6.5/2,0])
        cylinder(d=7,h=w,$fn=21);    
    }
}

module spacers()
{    
    translate([0,0,0])
    spacer();
    translate([0,31,0])
    spacer();
    translate([23.5,0,0])
    spacer();
    translate([23.5,31,0])
    spacer();
}

module spacer()
{
    pcb_h=1.65;

    difference()
    {
        union()
        {
            cylinder(d=3.5+2*w,h=receiver_pcb_height_total()-pcb_h,$fn=21);
            cylinder(d=3.5,h=receiver_pcb_height_total(),$fn=21);
        }
        translate([0,0,w])
        cylinder(d=2,h=receiver_pcb_height_total()+pcb_h,$fn=21);
    }
}
