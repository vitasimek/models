

pcb_h=1.65;

function receiver_pcb_height_total() = pcb_h + 10.3;

receiver_pcb();

module receiver_pcb()
{
    difference()
    {
        union()
        {
            pcb();

            translate([0,0,pcb_h])
            {
                ir_sensor();
                led();
                buttons();
            }
        }
            translate([7,6.5,0])
            spacers_holes();
    }
}

module pcb()
{
    cube([56,42,pcb_h]);
}

module spacers_holes()
{
    translate([5,0,0])
    spacer_hole(d=2);

    translate([0,0,0])
    spacer_hole();
    translate([0,31,0])
    spacer_hole();
    translate([23.5,0,0])
    spacer_hole();
    translate([23.5,31,0])
    spacer_hole();
}

module spacer_hole(d=3.5)
{
    cylinder(d=d,h=pcb_h,$fn=21);
}

module ir_sensor()
{
    translate([36,23,0])
    cube([8.5,7,10.3]);
}

module led()
{
    translate([49,5,0])
    cylinder(d=3.1,h=9,$fn=21);
    translate([49,5,9])
    cylinder(d=3.1,h=20,$fn=21);
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
    cube([6.5,6.5,3.5]);
    translate([6.5/2,6.5/2,0])
    cylinder(d=4,h=5,$fn=21);
    
//    translate([6.5/2,6.5/2,0])
//    #cylinder(d=4,h=20,$fn=21);    
}
