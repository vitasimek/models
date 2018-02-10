

h=10;
w=1.3;

difference()
{
	union()
	{
		difference()
		{
			translate([0,0,0])
			cube([w+w+9,5,h]);
			translate([6,12,h*1/2])
			rotate([90,0,0])
			cylinder(d=3.5,h=15,$fn=49);
		}
	
		difference()
		{
			translate([0,-w-w-9-10,0])
			cube([w+w+9,w+w+9+10,h]);
			translate([w,-w-9,0])
			cube([9,9,h]);
            translate([0,-w-w-9-10-1.5,h/2])
            rotate([0,90,0])
            cylinder(d=8,h=w+w+9,$fn=49);
		}
}

	translate([6,6,h/2])
	rotate([90,0,0])
	cylinder(d=3.5,h=8,$fn=49);
}