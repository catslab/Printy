use <nema8.scad>
use <Hexagon-102.scad>
$fn = 50;

taillex = 40;
tailley = 40;
taillez = 25;
epaisseur = 3;
/*
translate([-10,-tailley+10,27.5-epaisseur/2])
cube ([taillex,tailley,epaisseur]);
*/
//filament
/*
color("green")
translate([8.5+4-1+5.5+1.75/2-0.25,-19+2.5,-20])
cylinder(d=1.75,h=100);
*/
color("green")
translate([8.5+4-1-(5.5+1.75/2-0.25),-19+2.5-4,-20])
cylinder(d=1.75,h=100);

nema8();
translate([0,0,1.5])
worm();

translate([8.5+4-1,3,1.5+4+8])
rotate([90,0,0])
wormgear();

translate([8.5+4-1,-20-4,1.5+4+8])
rotate([-90,0,0])
gear();


//Axe roulement groove
/*
translate([8.5+4-1+8+5.5+1,-19-4.5,1.5+4+8])
rotate([-90,0,0])
bearing_axis();
translate([8.5+4-1+8+5.5+1,-19,1.5+4+8])
rotate([-90,0,0])
V625ZZ();
*/

translate([8.5+4-1-(8+5.5+1),-18-4.5-5,1.5+4+8])
rotate([-90,0,0])
bearing_axis();
translate([8.5+4-1-(8+5.5+1),-19-4,1.5+4+8])
rotate([-90,0,0])
V625ZZ();

/*
// glissière roulement
translate([8.5+4-1-(8+5.5+1)-6,-19-4.5-1.5,1.5+4+8-12])
cube ([10,5.5,24]);

translate([8.5+4-1-(8+5.5+1)-6,-19-4.5-1.5,1.5+4+8-12.5])
cube ([10,17,4]);

translate([8.5+4-1-(8+5.5+1)-6,-19-4.5+10,1.5+4+8-12])
cube ([10,5.5,24]);


translate([8.5+4-1-(8+5.5+1)-6,-19-4.5-1.5,1.5+4+8+8.5])
cube ([10,17,4]);
*/
/*
color("green")
translate([8.5+4-1-(8+5.5+1),-19-4.5,1.5+4+8+10])
rotate([-90,0,0])
cylinder(d=3,h=15);
*/

color("black")
translate([-30,-21-5.5,1.5+4+8+11])
rotate([0,90,0])
cylinder(d=3,h=30);

color("black")
translate([-30,-10-4.5,1.5+4+8+11])
rotate([0,90,0])
cylinder(d=3,h=30);

color("black")
translate([-30,-21-5.5,1.5+1])
rotate([0,90,0])
cylinder(d=3,h=30);

color("black")
translate([-30,-10-4.5,1.5+1])
rotate([0,90,0])
cylinder(d=3,h=30);

// coté
/*
translate([22,-tailley+10,2])
cube([3,tailley,25]);

translate([-10,7,2])
cube([taillex,3,25]);
*/
difference(){
translate([-15,-tailley+10,0])
cube ([taillex,tailley,taillez+2]);
translate([8.5+4-1,3,1.5+4+8])
rotate([90,0,0])
wormgear_hole();
    translate([8.5+4-1,12,1.5+4+8])
rotate([90,0,0])
cylinder(d=18,h=10);

translate([8.5+4-1,-8.5,1.5+4+8])
rotate([90,0,0])
cylinder(d=12,h=17);

translate([8.5+4-1,-20.5-5,1.5+4+8])
rotate([90,0,0])
cylinder(d=7,h=6);

translate([8.5+4-1,-20.5,1.5+4+8])
rotate([90,0,0])
cylinder(d=7,h=6);

translate([8.5+4-1-(5.5+1.75/2-0.25),-19+2.5-4,0])
cylinder(d=2,h=35);

translate([0,0,1.5])
cylinder(d=10,h=18);


translate([8.5+4-1-(8+5.5+1),-20.5-4,1.5+4+8])
rotate([-90,0,0])
cylinder(d=18,h=8);


translate([-11-6-2-4,-30-0.01,-0.01])
cube([20,20+0.01,taillez+2+0.02]);

translate([3,-31,18.5])
rotate([0,180,0])
passage();
translate([3,-18,18.5])
rotate([0,180,0])
passage();

translate([-15-0.01,-10-0.01,-0.01])
cube([taillex+0.02,20+0.02,2+0.01]);

}

color("blue")
translate([2.5,-29,18])
rotate([0,180,0])
passage2();

//axe principal
translate([8.5+4-1,-20-4-0.5+0.5-5,1.5+4+8])
rotate([-90,0,0])
wormgear_axis();


translate([8.5+4-1,-20-4-0.5-5,1.5+4+8])
rotate([-90,0,0])
694ZZ();

translate([8.5+4-1,3+0.5+2,1.5+4+8])
rotate([-90,0,0])
694ZZ();

rotate([0,180,0])
translate([-(8.5+4-1-(5.5+1.75/2-0.25)),-19+2.5-4,-82.5])
hexagon_hotend();


module wormgear_axis(){
color("red")
union()
{
    cylinder(d=4,h=3.5);
    translate([0,0,3.5])
    cylinder(d=5,h=31);
    translate([0,0,34.5])
    cylinder(d=4,h=3.5);
}
}
module bearing_axis(){
color("red")
union()
{
    cylinder(d=5,h=14);
}
}

module passage(){
    translate([1.5,0,1.5])
rotate([-90,0,0])
cylinder(d=3,h=8);
translate([1.5,0,8.5])
rotate([-90,0,0])
cylinder(d=3,h=8);

translate([1.5,0,0])
cube([13.5,8,10]);

translate([0,0,1.5])
cube([1.5,8,7]);
}

module passage2(){
    translate([1.5,0,1.5])
rotate([-90,0,0])
cylinder(d=3,h=5);
translate([1.5,0,7.5])
rotate([-90,0,0])
cylinder(d=3,h=5);

translate([1.5,0,0])
cube([13.5,5,9]);

translate([0,0,1.5])
cube([1.5,5,6]);
}