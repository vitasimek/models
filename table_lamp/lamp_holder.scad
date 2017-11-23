

union()
{
	difference()
	{
		cube([40,22,45]);
		translate([0,6,0])
		cube([40,22-12,45]);
		translate([7,22+6,5])
		rotate([90,30,0])
		cylinder(d=3,h=34,$fn=21);
	
		translate([7,22,5])
		rotate([90,30,0])
		cylinder(d=6.4,h=1,$fn=6);
	
		translate([7,17,5])
		rotate([90,30,0])
		cylinder(d=6.4,h=1,$fn=6);
	
		translate([7,6,5])
		rotate([90,30,0])
		cylinder(d=6.4,h=1,$fn=6);
	
		translate([7,1,5])
		rotate([90,30,0])
		cylinder(d=6.4,h=1,$fn=6);
	
		// --------
		
		translate([7,22,40])
		rotate([90,30,0])
		cylinder(d=4,h=34,$fn=21);
	
		translate([7,4,40])
		rotate([90,30,0])
		cylinder(d=8.4,h=4,$fn=6);
	
		translate([7,22,40])
		rotate([90,30,0])
		cylinder(d=8.4,h=4,$fn=21);
	
		// --------
		
		translate([32,22,23])
		rotate([90,30,0])
		cylinder(d=4,h=34,$fn=21);
	
		translate([32,4,23])
		rotate([90,30,0])
		cylinder(d=8.4,h=4,$fn=6);
	
		translate([32,22,23])
		rotate([90,30,0])
		cylinder(d=8.4,h=4,$fn=21);
	}
	
	difference()
	{
		translate([20,11,55])
		cylinder(d=12,h=30,$fn=49);
		translate([20,11,45])
		cylinder(d=8.1,h=40,$fn=49);
	}	

	difference()
	{
		translate([0,0,45])
		cube([40,22,10]);
		translate([0,11,45])
		rotate([0,90,0])
		cylinder(d=10,h=40,$fn=21);
		translate([20,11,45])
		cylinder(d=8.2,h=40,$fn=49);
	}
}	
