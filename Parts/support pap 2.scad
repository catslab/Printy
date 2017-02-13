$fn=200;
vis5 = 5.3;
vis4 = 4.2;
tete4=7;


difference(){
    union(){
        cube([50,50,5]);
        translate([0,25,0])
            cube([50,5,25]);
        translate([5,40-3,0])
            cube([40,6,7]);
        translate([14,25,15-3])
            cube([22,7,6]);
        }
        
        translate([10,35,2.5])
            cylinder(d=tete4,h=5.51);
        translate([40,35,2.5])
            cylinder(d=tete4,h=5.51);
            
        translate([10,10,-0.01])
            cylinder(d=vis4,h=5.02);
        translate([10,35,-0.01])
            cylinder(d=vis4,h=5.02);
            
        translate([40,10,-0.01])
            cylinder(d=vis4,h=5.02);
        translate([40,35,-0.01])
            cylinder(d=vis4,h=5.02);
        
        translate([10,25-0.01,15])
            rotate([-90,0,0])
            cylinder(d=vis5,h=10);
        translate([40,25-0.01,15])
            rotate([-90,0,0])
            cylinder(d=vis5,h=10);
}