use <nema8.scad>
use <Hexagon-102.scad>
$fn = 50;

//filament

color("green")
translate([8.5+4-1+5.5+1.75/2-0.25,-19+2.5,-20])
cylinder(d=1.75,h=100);

nema8();
translate([0,0,1.5])
worm();

translate([8.5+4-1,3,1.5+4+8])
rotate([90,0,0])
wormgear();

translate([8.5+4-1,-20,1.5+4+8])
rotate([-90,0,0])
gear();

translate([8.5+4-1+8+5.5+1,-19,1.5+4+8])
rotate([-90,0,0])
V625ZZ();

translate([8.5+4-1,-20-4-0.5,1.5+4+8])
rotate([-90,0,0])
694ZZ();

translate([8.5+4-1,3+0.5,1.5+4+8])
rotate([-90,0,0])
694ZZ();

rotate([0,180,0])
translate([-(8.5+4-1+5.5+1.75/2-0.25),-19+2.5,-80])
hexagon_hotend();