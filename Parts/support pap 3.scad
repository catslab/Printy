$fn=200;
vis5 = 5.25;
vis4 = 4.25;
tete4=7;
vis3= 3.25;
ecartement=31/2;
centrex=45;
centrey=50;

difference(){
    union(){
        cube([90,75,4]);
        translate([0,20,0])
            cube([90,4,25]);
        translate([17,24,0])
        rotate([0,90,0])
            linear_extrude(height = 4){
                polygon([
                    [0,-1],
                    [-24,-1],
                    [-4,50],
                    [0,50]
                ]);
            }
        translate([90-4-17,25,0])
        rotate([0,90,0])
            linear_extrude(height = 4){
                polygon([
                    [0,-1],
                    [-24,-1],
                    [-4,50],
                    [0,50]
                ]);
            }
        }
        translate([centrex-ecartement,centrey-ecartement,-0.01])
            cylinder(d=vis3,h=5.02);
        translate([centrex-ecartement,centrey+ecartement,-0.01])
            cylinder(d=vis3,h=5.02);
        translate([centrex+ecartement,centrey-ecartement,-0.01])
            cylinder(d=vis3,h=5.02);
        translate([centrex+ecartement,centrey+ecartement,-0.01])
            cylinder(d=vis3,h=5.02);
        translate([centrex,centrey,-0.01])
            cylinder(d=22.2,h=5.02);
        
        translate([45,50,-0.01])
            cylinder(d=22.2,h=5.02);
        
        translate([45,10,-0.01])
            cylinder(d=vis5,h=5.02);
        
        translate([10,10,-0.01])
            cylinder(d=vis5,h=5.02);
        translate([80,10,-0.01])
            cylinder(d=vis5,h=5.02);
        
        translate([10,20-0.01,15])
            rotate([-90,0,0])
            cylinder(d=vis5,h=10);
        translate([80,20-0.01,15])
            rotate([-90,0,0])
            cylinder(d=vis5,h=10);
            
        translate([-0.01,24,-0.01])
            cube([17,75-24+0.01,5.02]);
        translate([90-17,24,-0.01])
            cube([17.01,75-24+0.01,5.02]);
}