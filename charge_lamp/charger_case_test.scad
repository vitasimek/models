
$fn=7*4;

di=15;
do=50;

h3=20;
h2=7;
h1=0.25+0.35*2;

//translate([0,0,0])




translate([0,0,0])
cylinder(d=di,h=h2);
cylinder(d=do,h=h1);



translate([50,0,0])
cover();



module cover(c=0)
{
    difference()
    {
        cylinder(d=do*0.90,h=h1);
        cylinder(d=di+c,h=h1);
    }
}