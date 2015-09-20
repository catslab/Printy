$fn = 100;
difference()
        {
            linear_extrude(height=5)
            polygon( points=
                [[0,0],
                [60,0],
                [60,20],
                [20,60],
                [0,60]
            ]);
            translate([10,10,-0.01])
                cylinder(h=5.02,d=5.5);
            translate([30,10,-0.01])
                cylinder(h=5.02,d=5.5);
            translate([10,30,-0.01])
                cylinder(h=5.02,d=5.5);
            translate([50,10,-0.01])
                cylinder(h=5.02,d=5.5);
            translate([10,50,-0.01])
                cylinder(h=5.02,d=5.5);
        }