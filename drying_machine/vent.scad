use<ring.scad>

fn=8;
//hg=0.2+0.3*3;
hg=0.2+0.3*5;
h=20;
w=0.4*2;
width=200;

body();

module body()
{
    stackable_body(width, h, hg, w, fn);
}
