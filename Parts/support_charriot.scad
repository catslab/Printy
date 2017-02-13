$fn=50;
use <nema8.scad>
use <Hexagon-102.scad>

translate([20,62,20])
rotate([90,90,0])
{
    translate([0,-6,0])
nema8();
translate([0,-6,1.5])
worm();
translate([8.5+4-1,3-12,1.5+4+8])
rotate([90,0,180])
wormgear();
    
translate([8.5+4-1,-20+12+22,1.5+4+8])
rotate([-90,0,180])
gear();

}


translate([8.5+4-1+8+5.5+1+6.5,63,1.5+4+2])
rotate([-90,0,90])
V625ZZ();

translate([8.5+4-1,-20-4-0.5,1.5+4+8])
rotate([-90,0,0])
694ZZ();

translate([8.5+4-1,3+0.5,1.5+4+8])
rotate([-90,0,0])
694ZZ();


lg_plaque = 50;
ht_plaque = 48;
support_head = true;

use<Hexagon-102.scad>;

machine();
translate([50,43+0.8,32])
rotate([90,0,0])
bague();

translate([50,38,10])
rotate([90,0,0])
plaque();

//plaque();
/*translate([50,38,10])
rotate([90,0,0])
retenue();
*/
translate([55-lg_plaque/2,55,-60])
{
//hexagon_hotend();
translate([0,0,40])
cylinder(d=2,h=100);
}

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

module jhead(){
    translate([0,0,8.5])
        cylinder(d=16.25,h=9);
    color("silver")
    {
        cylinder(d=12.25,h=9);
        cylinder(d=16.25,h=5);
    }
}

module plaque(){
    difference(){
        union(){
            color("blue")
            {
                translate([-lg_plaque/2,-15,0])
                cube([lg_plaque,ht_plaque,5]);
                
                translate([-lg_plaque/4,11,-5])
                cube([lg_plaque/2,22,5]);
                if ( support_head )
                {
                    translate([-lg_plaque/2,-20,-32])
                        cube([lg_plaque,5,37]);
                    translate([0,10,0])
                        rotate([0,-90,0])
                            translate([0,0,-5/2])
                            linear_extrude(height=5)
                                polygon( points=
                                [[0,0],//0
                                [0,-25],//1
                                [-25,-25],//2
                                ]);    
                    translate([-lg_plaque/2,-28,-32])
                    cube([15,8,30]);
                    }   
                }
                
    }
    
        //Fixation
        translate([-10,-10,-0.01])
            cylinder(d=3.5,h=5.02);
        translate([10,-10,-0.01])
                cylinder(d=3.5,h=5.02);
        translate([-10,10,-0.01])
        {
            translate([0,0,-5])
            cylinder(d=8,h=5.02);
                cylinder(d=3.5,h=5.02);
        }
        translate([10,10,-0.01])
        {
            translate([0,0,-5])
            cylinder(d=8,h=5.02);
                cylinder(d=3.5,h=5.02);
        }    
        translate([0,22,-5.01])
                cylinder(d=16,h=10.02);  
        // - fixation
    if ( support_head )
    {
        // Jhead
        
        translate([-lg_plaque/2+4.5,-28.01,-17])
        rotate([-90,0,0])
        {
            translate([-5,0,-1.5])
    cube([10,16.25,7],center=true);
    translate([-5,0,4.5])
    cube([10,12.25,9],center=true);
    translate([-5,0,12.5])
    cube([10,16.25,8],center=true);
        jhead();
        }
        
        translate([-lg_plaque/2-1,-22,-6])
        rotate([0,90,0])
        cylinder(d=3.5,h=21);
        
        translate([-lg_plaque/2+10,-25,-10])
        cube([3,6,20]);
        
        translate([-lg_plaque/2-1,-22,-28])
        rotate([0,90,0])
        cylinder(d=3.5,h=21);
        
        translate([-lg_plaque/2+10,-19,-25])
        rotate([180,0,0])
        cube([3,6,20]);
        
        // - jhead
    }
                    
    }
    
    
}

module retenue(){
    difference(){
translate([-30,-28,-25])
        cube([5,15,30]);
translate([-lg_plaque/2+5,-28.01,-10])
        rotate([-90,0,0])
    jhead();
        translate([-lg_plaque/2-10,-22,1])
        rotate([0,90,0])
        cylinder(d=3.5,h=21);
        translate([-lg_plaque/2-10,-22,-21])
        rotate([0,90,0])
        cylinder(d=3.5,h=21);
    }
}

module machine(){
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
}