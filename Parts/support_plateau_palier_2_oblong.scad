$fn=150;

support_LMH10UU_4();




module support_LMH10UU_4()
{
    color("cyan")
    //translate([-30,-15,0])
    difference()
    {
    union()
        {
            /*
            translate([0,30,0])
                cube([60,20,4]);
            translate([40,50,0])
                cube([20,40,4]);
            translate([24,15,0])
                cube([30,15,4]);
             translate([34,15,0])
                cube([30,15,4]);
            translate([20,50,0])
                cube([25,25,4]);
            */
            translate([60+4-40,15,0])
                cube([40,15,4]);
            translate([0,30,0])
                linear_extrude(height=4)
                    polygon([[0,20],[0,0],[60,0],[60,60],[40,60]]);
            translate([44,15,0])
                cylinder(h=4,d=40);
            translate([60,30,0])
                cube([4,60,24]);
            translate([0,30-4,0])
                cube([60+4,4,24]);
            
            translate([64,10-4,4])
                rotate([0,-90,0])
                    linear_extrude(height=4)
                        polygon([[0,9],[0,20],[20,20]]);

            translate([28,10-4,4])
                rotate([0,-90,0])
                    linear_extrude(height=4)
                        polygon([[0,9],[0,20],[20,20]]);
        }
        translate([24,-7,-1])
                cube([40,10,7]);
        
        //Palier bronze
        translate([0,1,0])
        {
            translate([40+4,15,-0.02])
                cylinder(h=5.04,d=14.5);
            //rajout pour trous oblongs
            translate([40+4,13,-0.02])
                cylinder(h=5.04,d=14.5);
            translate([40+4-14.5/2,13,-0.02])
                    cube([14.5,2,5.04]);
        }
        translate([0,1,0])
        {
            translate([29.5+4,15,-0.02])
                cylinder(h=5.04,d=3.5);
            //rajout pour trous oblongs
            translate([29.5+4,13,-0.02])
                cylinder(h=5.04,d=3.5);
            translate([29.5+4-3.5/2,13,-0.02])
                cube([3.5,2,5.04]);
        }
        
        translate([0,1,0])
        {
            translate([50.5+4,15,-0.02])
                cylinder(h=5.04,d=3.5);
            //rajout pour trous oblongs
            translate([50.5+4,13,-0.02])
                cylinder(h=5.04,d=3.5);
            translate([50.5+4-3.5/2,13,-0.02])
                cube([3.5,2,5.04]);
        }
        
        //Attache 2020
        translate([10,40,-0.02])
            cylinder(h=5.04,d=4.5);
        translate([30,40,-0.02])
            cylinder(h=5.04,d=4.5);
        translate([50,40,-0.02])
            cylinder(h=5.04,d=4.5);
        translate([50,60,-0.02])
            cylinder(h=5.04,d=4.5);
        translate([50,80,-0.02])
            cylinder(h=5.04,d=4.5);
        
        translate([28,62,-0.02])
            cylinder(h=5.04,d=4.5);
            
        // Trous parois verticales
        translate([10,30.02,10+4])
            rotate([90,0,0])
                cylinder(h=5.04,d=4.5);
        translate([50,30.02,10+4])
            rotate([90,0,0])
                cylinder(h=5.04,d=5.5);

        translate([59.98,40,10+4])
            rotate([90,0,90])
                cylinder(h=5.04,d=5.5);
        translate([59.98,80,10+4])
            rotate([90,0,90])
                cylinder(h=5.04,d=4.5);

        
    }
}