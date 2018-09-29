


w=2*0.4;


//input();

output(w*4);


module output(w)
{
    d=38;
    h=40;
    delta=1;
    
    difference()
    {        
        union()
        {
            cylinder(d=70,h=3);
            cylinder(d1=d+2*w, d2=d+2*w+delta,h=h,$fn=77);
        }            
        cylinder(d1=d, d2=d+delta,h=h,$fn=77);
    }
}

module input()
{
    difference()
    {
        tube(33, 20);
        tube(33, 20, w);
    }
}

module tube(d,h,w=0,delta=1)
{
    cylinder(d1=d-2*w+delta, d2=d-2*w,h=h,$fn=77);
}