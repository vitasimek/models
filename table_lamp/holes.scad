



d0 = 7.9;
step = 0.1;
count = 5;

difference()
{
	translate([-d0*1.5/2,-d0*1.5/2,0])
	cube([(count+1)*1.5*d0,1.5*d0,3]);
	
	for(i = [0:count])
	{
		echo(d0 + i * step);
		translate([d0*1.5*i,0,0])
		cylinder(d=d0 + i * step,h=3,$fn=6);
	}
}