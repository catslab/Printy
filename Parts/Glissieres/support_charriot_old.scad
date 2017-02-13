$fn=150;


color("silver")
cube([100,20,20]);
color("teal")
translate([0,20,4])
cube([100,7.5,12]);
color("pink")
translate([26,23,-3.5])
cube([48,10,27]);

translate([50,-40,32])
rotate([-90,0,0])
cylinder(d=10,h=100);

/*
translate([50,38+0.8,32])
rotate([90,0,0])
bague();
*/


translate([50,38,10])
rotate([90,0,0])
plaque();

module bague(){
    difference(){
        union(){
            color("black")
            {
    cylinder(d=16,h=10);
    cylinder(d=17.4,h=0.8);
        }
    }
    translate([0,0,-0.01])
        cylinder(d=10.2,h=10.02);    
    }
}

module plaque(){
    difference(){
        union(){
            color("blue")
            {
                translate([-15,-15,0])
                cube([30,48,5]);
                translate([-15,13.5,5])
                cube([30,19.5,5]);
            }
    }
    translate([-10,-10,-0.01])
        cylinder(d=3.5,h=5.02);
    translate([10,-10,-0.01])
            cylinder(d=3.5,h=5.02);
    translate([-10,10,-0.01])
            cylinder(d=3.5,h=5.02);
    translate([10,10,-0.01])
            cylinder(d=3.5,h=5.02);    
    translate([0,22,-0.01])
            cylinder(d=16,h=10.02);  
    }
}