$fn=150;
difference(){
union(){
cube([20,28,3],false);

cube([3,28,12+3]);
}
translate([8,5,-3.1])
    cylinder(h=6.2,d=4.5);
translate([8,23,-3.1])
    cylinder(h=6.2,d=4.5);
    
translate([12,5,-3.1])
    cylinder(h=6.2,d=4.5);
translate([12,23,-3.1])
    cylinder(h=6.2,d=4.5);

translate([8,23-4.5/2,-0.05])
cube([12-8,4.5,3.1]);
translate([8,5-4.5/2,-0.05])
cube([12-8,4.5,3.1]);

translate([-0.1,4.5,9])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
translate([-0.1,23.5,9])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
}