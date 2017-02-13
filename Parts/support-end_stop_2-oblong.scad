$fn=150;
difference(){
union(){
cube([20,28,3],false);

cube([3,28,2+3]);
    rotate ([90,0,90])
    linear_extrude(height = 3)
    polygon([[0,0],[28,0],[28,5],[19,32],[9,32],[0,5]]);
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

translate([-0.1,14,7.5])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
translate([-0.1,14,11.5])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
translate([-0.1,14,26.5])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
        translate([-0.1,14,30.5])
    rotate([0,90,0])
        cylinder(h=4,d=3.5);
        
translate([-0.1,14-3.5/2,7.5])
    cube([4,3.5,4]);
    translate([-0.1,14-3.5/2,26.5])
    cube([4,3.5,8]);
}