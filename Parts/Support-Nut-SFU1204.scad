$epaisseur=4;
$fn=150;

support_SFU1204_nut_2();

module support_SFU1204_nut_2()
{
    color("cyan")
    {
        {
            difference()
            {
                union()
                {
                    translate([-22,0,0])
                        cube([44,20,$epaisseur]);
                    translate([-40,20,0])
                        cube([80,20,$epaisseur]);
                    cylinder(h=$epaisseur,d=44+2*$epaisseur);
                    translate([-40,20-$epaisseur,0])
                        cube([80,4,20+$epaisseur]);
                    
                    translate([-22,0,0])
                    rotate([0,-90,0])
                        linear_extrude(height=$epaisseur)
                        polygon([[0,0],[0,20],[20+$epaisseur,20],
                            [20+$epaisseur,20],
                            [20+$epaisseur,20-$epaisseur],
                            [$epaisseur,0]]);
                    translate([22+$epaisseur,0,0])
                    rotate([0,-90,0])
                        linear_extrude(height=$epaisseur)
                        polygon([[0,0],[0,20],[20+$epaisseur,20],
                            [20+$epaisseur,20],
                            [20+$epaisseur,20-$epaisseur],
                            [$epaisseur,0]]);
                }
                // Trous bas
                translate([-30,30,-0.1])
                    cylinder(h=5.2,d=5.5);
                translate([-10,30,-0.1])
                    cylinder(h=5.2,d=5.5);
                translate([10,30,-0.1])
                    cylinder(h=5.2,d=5.5);
                translate([30,30,-0.1])
                    cylinder(h=5.2,d=5.5);
                // Trous coté
                translate([0,20-$epaisseur-0.1,10+$epaisseur])
                    rotate([-90,0,0])
                    {
                        translate([-34,0,0])
                            cylinder(h=5.2,d=5.5);
                        translate([-10,0,0])
                            cylinder(h=5.2,d=5.5);
                        translate([10,0,0])
                            cylinder(h=5.2,d=5.5);
                        translate([34,0,0])
                            cylinder(h=5.2,d=5.5);
                    }
                // Encoche Vis 12
                translate([0,0,-0.1])
                    cylinder(h=5.2,d=14);
                translate([-7,-25,-0.1])
                    cube([14,25,5.5]);
                // Trous fixation
                translate([-16,0,-0.1])
                    cylinder(h=5.2,d=4.5);
                translate([16,0,-0.1])
                    cylinder(h=5.2,d=4.5);
                    
                translate([-22-$epaisseur,-17-20,-0.1])
                    cube([44+2*$epaisseur,20,$epaisseur+0.2]);
            }
        }
    }
}