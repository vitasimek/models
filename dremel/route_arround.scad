



cube([40,50,15]);

translate([200-60,0,0])
cube([60,70,15]);

translate([0,7,15/2])
#rod();

tool_d=40;

translate([200-tool_d/2-10,tool_d/2+20,0])
#cylinder(d=tool_d,h=15+5,$fn=49);

module rod()
{
	rod_d=8;
	rod_l=200;

	//translate([0,0,rod_d/2])
	rotate([0,90,0])
	cylinder(d=rod_d,h=rod_l,center=false,$fn=28);
}