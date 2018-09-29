

use <threads/quickthread.scad>;

//difference()
{
    //translate([-20,-20,0])
    //cube([40,40,10]);
    translate([0,0,0])
    #isoThread(d=20, h=10, pitch=1);
    translate([0,0,10])
    #isoThread(d=20, h=10, pitch=2);
    translate([0,0,20])
    #isoThread(d=20, h=10, pitch=3);
    translate([0,0,30])
    #isoThread(d=20, h=10, pitch=7);
    //thread_out(dia=20,hi=15,thr=177);
    //cylinder(d=17,h=10,$fn=77);
}