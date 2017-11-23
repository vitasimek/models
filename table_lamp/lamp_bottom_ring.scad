$fn=74;

difference()
{
	union()
	{
		cylinder(d=71, h=10);
		translate([-13,-40,0])
		cube([26,80,3]);
	}

	cylinder(d=67, h=10);

	difference()
	{
		cylinder(d=87, h=3);
		cylinder(d=77, h=3);
	}
}