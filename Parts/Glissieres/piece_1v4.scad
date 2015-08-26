

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
facettes=100;
color("red")
//translate([0,0,largeur/2])
//rotate([0,-90,0])

difference()
{
    // BLoc principal
    union() 
    {
        cylinder(h=hauteur,r=largeur/2,$fn=facettes);
    
        translate([0,1,0])
            linear_extrude(height=hauteur)
                square([largeur+largeur/2-2+x_axe_vis,largeur/2-1]);
        
        translate([0,0,hauteur/3])
        linear_extrude(height=hauteur/3)
            polygon( points=
            [[0,3],//0
            [30,3],//1
            [30,-25.5],//2
            [20,-25.5],//3
            [0,-12],//4
            ]);
        /*
        //serrage de la courroie
        translate([20,-25.5,2*hauteur/3+2])
            linear_extrude(height=6)
                square([10,25.5]);
        translate([20,-25.5,hauteur/3-2-6])
            linear_extrude(height=6)
                square([10,25.5]);
        translate([20,-25.5,2*hauteur/3+2+6+2])
            linear_extrude(height=6)
                square([10,25.5]);
        */

    } // union

    
    
    //trou no 1
    translate([x_cent_tige,.5,hauteur-z_cent_tige])
        rotate([-90,0,0])
            cylinder(h=largeur/2+2,r=(diam_tige+jeu_tige)/2,$fn=facettes);
    //trou no 2
    translate([x_cent_tige,.5,z_cent_tige])
        rotate([-90,0,0])
            cylinder(h=largeur/2+2,r=(diam_tige+jeu_tige)/2,$fn=facettes);
  
    // Coche no 1
    translate([largeur*1.2,largeur/2-1,hauteur - z_cent_tige])
        cube([x_cent_tige,largeur,2],center=true);
    // Coche no 2
    translate([largeur*1.2,largeur/2,z_cent_tige])
        cube([x_cent_tige,largeur,2],center=true);
     
    //trou Vis de serrage 1
    translate([largeur+largeur/2-diff_trou/2+x_axe_vis,largeur/4+0.5,-0.5])
        cylinder(h=21,d=trou_de_vis_3,$fn=facettes);
        
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
            cylinder(h=21,d=trou_de_vis_3,$fn=facettes);

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
    rotate_extrude($fn=facettes) 
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
    translate([25,-4.5,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([25,-21,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3,$fn=facettes);
    //courroie 1
    translate([30.01,-16.5,hauteur/3-2+0.01])
        rotate([0,-180,0])
        {
            cube([20,6.51 ,0.63]);
            
            r=0.75;
            h=6.51;
            // small number
            e=.02;
            for ( i = [0 : 9] )
            {
                translate([1+i*2,0,0.63])
                    rotate([-90,90,0])
                        difference()
                        {
                            cylinder(h,r,r,$fn=facettes);
                            translate ([0,-(r+e),-e]) cube([2*(r+e),2*(r+e),h+2*e]);
                        }
            }
        }
    
    //courroie 2
    translate([19.99,-16.5,2*hauteur/3+8+2-0.01])
    {   
        cube([20,6.51 ,0.63]);
        
        r=0.75;
        h=6.51;
        // small number
        e=.02;
        for ( i = [0 : 9] )
        {
            translate([1+i*2,0,0.63])
            rotate([-90,90,0])
            difference()
            {
                cylinder(h,r,r,$fn=facettes);
                translate ([0,-(r+e),-e]) cube([2*(r+e),2*(r+e),h+2*e]);
            }
        }
    }

     // Ecrous de serrage courroie
    difference_ecrou = 9-epaisseur_ecrou_3/2;
    // Passage ecrou 3
    translate([25,-largeur_ecrou_3/2-21,hauteur/2-difference_ecrou])
    {
        cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);

    translate([0,largeur_ecrou_3/2,epaisseur_ecrou_3])
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
    }  
    translate([25,-largeur_ecrou_3/2-4.5,hauteur/2-difference_ecrou])
    {
        cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);

    translate([0,largeur_ecrou_3/2,epaisseur_ecrou_3])
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
    }
 // Passage ecrou 3
    translate([25,-largeur_ecrou_3/2-21,hauteur/2+12-difference_ecrou])
    {
        cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);

    translate([0,largeur_ecrou_3/2,epaisseur_ecrou_3])
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
    }  
    translate([25,-largeur_ecrou_3/2-4.5,hauteur/2+12-difference_ecrou])
    {
        cube([hauteur_ecrou_3+1,largeur_ecrou_3 ,epaisseur_ecrou_3]);

    translate([0,largeur_ecrou_3/2,epaisseur_ecrou_3])
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
    }
    
} // fin piece
/*
difference()
{
    //serrage de la courroie
    translate([20,-25.5,0])
            linear_extrude(height=6)
                square([10,25.5]);
    //courroie 1
    color("blue")
    translate([10.01,-16.5,6.0-0.63])
        cube([20,6.51 ,0.64]);
    translate([30.01,-16.5,6.01])
    {
        rotate([0,-180,0])
        {
            r=0.75;
            h=6.51;
            // small number
            e=.02;
            for ( i = [0 : 9] )
            {
                translate([1+i*2,0,0.63])
                    rotate([-90,90,0])
                        difference()
                        {
                            cylinder(h,r,r,$fn=facettes);
                            translate ([0,-(r+e),-e]) cube([2*(r+e),2*(r+e),h+2*e]);
                        }
            }
        }
    }
    translate([25,-4.5,-1])
        cylinder(h=10,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([25,-21,-1])
        cylinder(h=10,d=trou_de_vis_3,$fn=facettes);
 }
 */