//Partie tenant les diam_tiges
largeur = 24;
hauteur=60;
diam_tige=10;
jeu_tige=0.1;
trou_de_vis_3 = 3.5;
x_axe_vis = -1;
largeur_ecrou_3 = 5.8;
hauteur_ecrou_3 = 6.5;
epaisseur_ecrou_3 = 3;
profondeur_trou_vis_3 = 22;
x_cent_tige = 20;
z_cent_tige = 10;
//glissière
diam_bague = 15.9;
prof_bague=12.5;
chanfrein = 0.5;

diff_trou = largeur+largeur/2 - (x_cent_tige+diam_tige/2);
$fn=200;
color("red")
//translate([0,0,largeur/2])
//rotate([0,-90,0])

difference()
{
    // BLoc principal
    union() 
    {
        cylinder(h=hauteur,r=largeur/2);
    
        translate([0,1,0])
            linear_extrude(height=hauteur)
                square([largeur+largeur/2-2+x_axe_vis,largeur/2-1]);
        
        translate([0,0,hauteur/3])
        linear_extrude(height=hauteur/3)
            polygon( points=
            [[0,3],//0
            [24,3],//1
            [24,-25.5],//2
            [10,-25.5],//3
            [0,-12],//4
            ]);

    } // union

    
    
    //trou no 1
    translate([x_cent_tige,.5,hauteur-z_cent_tige])
        rotate([-90,0,0])
            cylinder(h=largeur/2+2,r=(diam_tige+jeu_tige)/2);
    //trou no 2
    translate([x_cent_tige,.5,z_cent_tige])
        rotate([-90,0,0])
            cylinder(h=largeur/2+2,r=(diam_tige+jeu_tige)/2);
  
    // Coche no 1
    translate([largeur*1.2,largeur/2-1,hauteur - z_cent_tige])
        cube([x_cent_tige,largeur,2],center=true);
    // Coche no 2
    translate([largeur*1.2,largeur/2,z_cent_tige])
        cube([x_cent_tige,largeur,2],center=true);
     
    //trou Vis de serrage 1
    translate([largeur+largeur/2-diff_trou/2+x_axe_vis,largeur/4+0.5,-0.5])
        cylinder(h=21,d=trou_de_vis_3);
        
    // passage ecrou 3mm
    translate([x_axe_vis+largeur+largeur/2-hauteur_ecrou_3+0.5,largeur/4+0.5-largeur_ecrou_3/2,diam_tige*1.52])
        cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);
    translate([x_axe_vis+largeur+largeur/2-diff_trou/2-0.5,largeur/4+0.5,diam_tige*1.52])
        rotate([0,0,90])
            linear_extrude(height=epaisseur_ecrou_3)
                polygon( points=
                [[0,-hauteur_ecrou_3/2],//0
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
                [0,hauteur_ecrou_3/2],//3
                [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
                [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
                ]);

    //trou Vis de serrage 2
    translate([x_axe_vis+largeur+largeur/2-diff_trou/2,largeur/4+0.5,hauteur+0.5])
        rotate([0,180,0])
            cylinder(h=21,d=trou_de_vis_3);

    // Passage ecrou 2
    translate([x_axe_vis+largeur+largeur/2-hauteur_ecrou_3+0.5,largeur/4+0.5+largeur_ecrou_3/2,hauteur-diam_tige*1.52])
        rotate([180,0,0])
            cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);
    translate([largeur+largeur/2-diff_trou/2-0.5,largeur/4+0.5,hauteur-diam_tige*1.52])
        rotate([0,180,90])
            linear_extrude(height=epaisseur_ecrou_3)
                polygon( points=
                [[0,-hauteur_ecrou_3/2],//0
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
                [0,hauteur_ecrou_3/2],//3
                [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
                [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
                ]);
    //Extrusion 
    //translate([largeur*1.5,largeur/2,0])
    rotate_extrude() 
        polygon( points=
        [[0,hauteur+1],//0
        [diam_bague/2+chanfrein,hauteur+1],//1
        [diam_bague/2+chanfrein,hauteur],//2
        [diam_bague/2,hauteur-chanfrein],//3
        [diam_bague/2,hauteur-prof_bague+chanfrein],//4
        [diam_bague/2-chanfrein,hauteur-prof_bague],//5
        [diam_tige/2+0.5+chanfrein,hauteur-prof_bague],//6
        [diam_tige/2+0.5,hauteur-prof_bague-chanfrein],//7
        [diam_tige/2+0.5,prof_bague+chanfrein], //8
        [diam_tige/2+0.5+chanfrein,prof_bague],
        [diam_bague/2-chanfrein,prof_bague],
        [diam_bague/2,prof_bague-chanfrein], //11
        [diam_bague/2,chanfrein],
        [diam_bague/2+chanfrein,0],
        [diam_bague/2+chanfrein,-1],
        [0,-1]
        ]);
 // vis de serrage courroie 1
    translate([19,-4.5,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3);
    // vis de serrage courroie 2   
    translate([15,-21,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3);
     // Ecrous de serrage courroie
    difference_ecrou = 9-epaisseur_ecrou_3/2;
    // Passage ecrou 3
     translate([15,-21,2*hauteur/3-epaisseur_ecrou_3-3])
     {
        rotate([0,0,-90])
        {
            translate([0,-largeur_ecrou_3/2,0])
                cube([hauteur_ecrou_3+10,largeur_ecrou_3 ,epaisseur_ecrou_3]);
            rotate([0,0,90])
                linear_extrude(height=epaisseur_ecrou_3)
                polygon( points=
                [[0,-hauteur_ecrou_3/2],//0
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
                [0,hauteur_ecrou_3/2],//3
                [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
                [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
                ]);
        }
    }  

    translate([15,-21,hauteur/3+3])
     {
        rotate([0,0,-90])
        {
            translate([0,-largeur_ecrou_3/2,0])
                cube([hauteur_ecrou_3+10,largeur_ecrou_3 ,epaisseur_ecrou_3]);
            rotate([0,0,90])
                linear_extrude(height=epaisseur_ecrou_3)
                polygon( points=
                [[0,-hauteur_ecrou_3/2],//0
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
                [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
                [0,hauteur_ecrou_3/2],//3
                [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
                [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
                ]);
        }
    }  

    translate([15,-4.5,hauteur/3+3])
     {

        translate([0,-largeur_ecrou_3/2,0])
            cube([hauteur_ecrou_3+10,largeur_ecrou_3 ,epaisseur_ecrou_3]);
        rotate([0,0,90])
            linear_extrude(height=epaisseur_ecrou_3)
            polygon( points=
            [[0,-hauteur_ecrou_3/2],//0
            [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
            [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
            [0,hauteur_ecrou_3/2],//3
            [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
            [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
            ]);
    } 
    translate([15,-4.5,2*hauteur/3-epaisseur_ecrou_3-3])
    { 
        translate([0,-largeur_ecrou_3/2,0])
            cube([hauteur_ecrou_3+10,largeur_ecrou_3 ,epaisseur_ecrou_3]);
        rotate([0,0,90])
            linear_extrude(height=epaisseur_ecrou_3)
            polygon( points=
            [[0,-hauteur_ecrou_3/2],//0
            [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(-30)],//1
            [largeur_ecrou_3/2,hauteur_ecrou_3/2*sin(30)],//2
            [0,hauteur_ecrou_3/2],//3
            [-largeur_ecrou_3/2,hauteur_ecrou_3/2*cos(60)],//4
            [-largeur_ecrou_3/2,-hauteur_ecrou_3/2*cos(60)]//5
            ]);
    }

    
} // fin piece
