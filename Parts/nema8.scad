
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

module nema8(){
width = 20;
height = 30;
shoulder = 1.5;
shoulder_diam = 15;
shaft = 4;
shaft_length = 20;


color("black")
translate([0,0,-height/2])
cube([width,width,height],center=true);
color("silver")
cylinder(h=shoulder,d=shoulder_diam);
color("silver")
cylinder(d=shaft,h=shaft_length);
}

module worm(){
    diam = 8;
    length_scre = 16;
    smooth = 4;
    shaft = 4;
    difference(){
        union(){
            color("teal")
            cylinder(d=diam,h=smooth);
            color("gold")
            translate([0,0,smooth])
            cylinder(d=diam,h=length_scre);
        }
        translate([0,0,-0.01])
        cylinder(d=shaft,h=length_scre+smooth+0.02);
    }
}

module wormgear(){
    outer = 17;
    hole = 5;
    thickness = 12;
    tooth_thickness = 6;
    stepped_diameter = 8;
    color("pink")
    difference(){
        union(){
            cylinder(d=outer,h=tooth_thickness);
            translate([0,0,tooth_thickness])
            cylinder(d=stepped_diameter,h=thickness-tooth_thickness);
        }
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}

module wormgear_hole(){
    outer = 18;
    thickness = 12;
    tooth_thickness = 6;
    stepped_diameter = 12;
    color("pink")
        union(){
            cylinder(d=outer,h=tooth_thickness+1);
            translate([0,0,tooth_thickness])
            cylinder(d=stepped_diameter,h=thickness-tooth_thickness);
        }
}


module gear(){
    outer = 11;
    hole = 5;
    thickness = 11;
    tooth_thickness = 7;
    stepped_diameter = 9;
    color("Khaki")
    difference(){
        union(){
            cylinder(d=outer,h=tooth_thickness);
            translate([0,0,tooth_thickness])
            cylinder(d=stepped_diameter,h=thickness-tooth_thickness);
        }
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}

module V625ZZ(){
    outer = 16;
    hole = 5;
    thickness = 5;
    color("Gainsboro")
    difference(){
            cylinder(d=outer,h=thickness);
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
        rotate_extrude(convexity = 10)
        translate([8.5, 5/2, 0])
        circle(r = 1);
    }
}

//684ZZ 4mm*9mm*4mm
//685ZZ 5mm*11mm*5mm
//694ZZ 4mm*11mm*4mm
//695ZZ 5mm*13mm*4mm

module 684ZZ(){
    outer = 9;
    hole = 4;
    thickness = 4;
    color("Gainsboro")
    difference(){
            cylinder(d=outer,h=thickness);
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}
module 694ZZ(){
    outer = 11;
    hole = 4;
    thickness = 4;
    color("Gainsboro")
    difference(){
            cylinder(d=outer,h=thickness);
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}
module 685ZZ(){
    outer = 11;
    hole = 5;
    thickness = 5;
    color("Gainsboro")
    difference(){
            cylinder(d=outer,h=thickness);
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}
module 695ZZ(){
    outer = 13;
    hole = 5;
    thickness = 5;
    color("Gainsboro")
    difference(){
            cylinder(d=outer,h=thickness);
        translate([0,0,-0.01])
        cylinder(d=hole,h=thickness+0.02);
    }
}
