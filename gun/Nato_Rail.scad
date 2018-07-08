
nato_rail (1, true);


    module nato_rail (n, has_base)
    {
        ws = 5.35;

        h0 = 5;
        h1 = 3.53;
        h2 = 5.87;
        h3 = 3;

        w0 = 20;
        w1 = 15.6;
        
        l = 10 * (n + 1) - ws;
        
        translate ([0, 0, - h0])
        rotate ([90, 0, 90])
        translate ([0, 0, -l/2])
        rail(h0, h1, l, w0, w1);
        
        
        module rail(h0, h1, l, w0, w1)
        {
            difference ()
            {
                union ()
                {
                    railbase(h0, h1, l, w0, w1, has_base);
                    translate ([0, h0 + h1, 0])
                    railprism (l);
                };
                union ()
                {
                    for (i = [1:1:n]) {
                        translate ([0, h0 + h1, 10 * i - ws])
                        railslot(ws);
                    }
                };
            };
        };

        module railbase (h0, h1, l, w0, w1, has_base)
        {
            if (has_base) {
                translate ([0, h0 / 2, l/2])
                cube ([w0, h0, l], center = true);
                mirror([1,0,0])
                basefillet (h0, l, w1);
                basefillet (h0, l, w1);
            }
            translate ([0, h0 + h1 / 2, l/2])
            cube ([w1, h1, l], center = true);
        }
        
        module basefillet (h0, l, w1)
        {
        difference() {
                translate ([w1 / 2, h0, 0])
                cube ([1.5, 1.5, l]);
                translate ([w1 / 2 + 1.5, h0 + 1.5, l / 2])
                cylinder (l+1, 1.5, 1.5, $fn=64, center = true);
            }
        }
        
        module railprism (l)
        {
            linear_extrude (height = l, convexity = 10)
            polygon (points = [[7.8, 0], [10.6, 2.8], [10.6, 3.34], [8.07, 5.87], [-8.07, 5.87], [-10.6, 3.34], [-10.6, 2.8], [-7.8, 0]], convexity = 10);
        }
        
        module railslot (l)
        {
            linear_extrude (height = l, convexity = 10)
            polygon (points = [[11, 6], [11, 2.65], [10.4, 2.6], [10.4, 2.87], [-10.4, 2.87], [-10.4, 2.6], [-11, 2.65], [-11, 6]], convexity = 10);
        }
        
    }

