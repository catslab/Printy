use<charriot_v5.scad>;
use<Hexagon-102.scad>;
$fn=50;
hauteur_charriot = 44;
hauteur_hotend=55.5;

charriot_v5();

translate([9,9,hauteur_charriot/2+hauteur_hotend])
rotate([0,180,-90])
hexagon_hotend();

translate([-9,-9,hauteur_charriot/2+hauteur_hotend])
rotate([0,180,90])
hexagon_hotend();

//support fan
color("red")
difference(){
    translate([-22,-25,hauteur_charriot/2])
    rotate([0,0,00])
    cube([1,32,38]);

    // passage air
    translate([-22-0.01,-9,hauteur_charriot/2+23])
    rotate([0,90,0])
    cylinder(h=1.02,d=28.4);
    
    //fixations
    translate([-22-0.01,-21,hauteur_charriot/2+35])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
    translate([-22-0.01,-21,hauteur_charriot/2+11])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
    translate([-22-0.01,3,hauteur_charriot/2+35])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
}

color("blue")
translate([-21,-25,hauteur_charriot/2])
rotate([0,0,00])
cube([12,1,38]);


color("navy")
translate([-10,-25,hauteur_charriot/2])
rotate([0,0,-30])
cube([15,1,38]);

color("pink")
translate([-21,6,hauteur_charriot/2])
rotate([0,0,00])
cube([10,1,38]);

//milieu
color("red")
translate([0,0,hauteur_charriot/2+19])
rotate([0,0,-30])
cube([26,1,38], center=true);

rotate([0,0,180])
{
//support fan
color("red")
difference(){
    translate([-22,-25,hauteur_charriot/2])
    rotate([0,0,00])
    cube([1,32,38]);

    // passage air
    translate([-22-0.01,-9,hauteur_charriot/2+23])
    rotate([0,90,0])
    cylinder(h=1.02,d=28.4);
    
    //fixations
    translate([-22-0.01,-21,hauteur_charriot/2+35])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
    translate([-22-0.01,-21,hauteur_charriot/2+11])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
    translate([-22-0.01,3,hauteur_charriot/2+35])
    rotate([0,90,0])
    cylinder(h=1.02,d=3.2);
}

color("blue")
translate([-21,-25,hauteur_charriot/2])
rotate([0,0,00])
cube([12,1,38]);


color("navy")
translate([-10,-25,hauteur_charriot/2])
rotate([0,0,-30])
cube([15,1,38]);

color("pink")
translate([-21,6,hauteur_charriot/2])
rotate([0,0,00])
cube([10,1,38]);


}