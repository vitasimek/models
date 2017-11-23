	



d0 = 11.7;
step = 0.05;
count = 6;

translate([-d0*1.5/2,-d0*1.5/2,0])
cube([(count+1)*1.5*d0,1.5*d0,0.4]);

for(i = [0:count])
{
	echo(d0 + i * step);
	translate([d0*1.5*i,0,0])
	difference()
	{
		cylinder(d=d0 + i * step,h=10,$fn=100);
		cylinder(d=d0 * 0.8,h=10,$fn=100);
	}
}