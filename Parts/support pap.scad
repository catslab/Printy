$fn=200;
vis5 = 5.3;
vis4 = 4.2;
tete4=7;

difference(){
    union(){
        cube([90,20,5]);
        translate([20,0,0])
            cube([50,50,5]);
        translate([30-2,15,0])
            cube([4,20,7.5]);
        translate([60-2,15,0])
            cube([4,20,7.5]);
        }
        translate([10,10,-0.01])
            cylinder(d=vis5,h=8.02);
        translate([80,10,-0.01])
            cylinder(d=vis5,h=8.02);
        
        translate([30,15,-0.01])
            cylinder(d=tete4,h=2.51);
        translate([60,15,-0.01])
            cylinder(d=tete4,h=2.51);
            
        translate([30,15,-0.01])
            cylinder(d=vis4,h=8.02);
        translate([60,15,-0.01])
            cylinder(d=vis4,h=8.02);
            
        translate([30,35,-0.01])
            cylinder(d=vis4,h=8.02);
        translate([60,35,-0.01])
            cylinder(d=vis4,h=8.02);
}