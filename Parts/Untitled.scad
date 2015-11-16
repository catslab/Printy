$fn=100;



difference()
{
    union()
    {
        for ( i=[0:5] )
        {
            color("silver")
                translate([0,0,i*4])
                    extrusion_1();
        }
        color("silver")
            cylinder(d=8,h=22);
        color("teal")
            translate([0,0,-4])
                cylinder(d=3.5,h=2);
        color("teal")
            translate([0,0,-2])
                cylinder(d=7,h=2);
        color("teal")
            translate([0,0,-10])
                cylinder(d=6,h=6);
        color("teal")
                cylinder(d=6,h=22.01);
        color("teal")
            translate([0,0,22])
                cylinder(d=5,h=6);
        color("teal")
            translate([0,0,-11])
                cylinder(d=4,h=1);
        color("teal")
            translate([0,0,-12])
                cylinder(d1=2,d2=4,h=1);
    }
    translate([0,0,-12.01])
        cylinder(d=2,h=40.02);
}


module extrusion_1()
        {
         linear_extrude(height = 2, convexity = 10, twist = 0)
            polygon( points=
            [[-9,5.2],//0
            [0,10.4],//1
            [9,5.2],//2
            [9,-5.2],//3
            [0,-10.4],//4
            [-9,-5.2],//5
            ]);
        }