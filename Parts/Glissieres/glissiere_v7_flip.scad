//Partie tenant les diam_tiges
largeur = 22;
epaisseur_support = 10;
largeur_support = 25;
hauteur=40;
entraxe=20;
diam_tige=10;
jeu_tige=0.1;
trou_de_vis_3 = 3.5;
x_axe_vis = -1;
largeur_ecrou_3 = 5.8;
hauteur_ecrou_3 = 6.5;
epaisseur_ecrou_3 = 3;
profondeur_trou_vis_3 = 22;
x_cent_tige = 15;
z_cent_tige = 10;
//glissière
diam_bague = 15.9;
prof_bague=12.5;
chanfrein = 0.5;

diff_trou = largeur+largeur/2 - (x_cent_tige+diam_tige/2);
facettes=50;

//translate([0,0,largeur/2])
//rotate([0,-90,0])

  
color("red")
difference()
{
    // BLoc principal
    union() 
    {
        cylinder(h=hauteur,r=largeur/2,$fn=facettes);
    
        translate([0,2,hauteur/6])
            cube ([24, 9, 4*hauteur/6]);
        //translate([-largeur_support+5,0,hauteur/4])
        //    cube ([largeur_support-5, epaisseur_support+1, hauteur/2]);
        //translate([-largeur_support+2,0,hauteur/6])
        //    cube ([largeur_support-2, epaisseur_support+1, 4*hauteur/6]);
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
    
    // Extrusion
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
    
    //trou no 1
   // translate([x_cent_tige+2.5,2-.01,hauteur/2])
  //      rotate([-90,0,0])
   //         cylinder(h=epaisseur_support+0.02,d=diam_tige+jeu_tige,$fn=facettes);
    //trou no 2
    translate([x_cent_tige,2-.01,hauteur/2])
        rotate([-90,0,0])
            cylinder(h=epaisseur_support+0.02,d=diam_tige+jeu_tige,$fn=facettes);
  
   
   translate([x_cent_tige,5.5,hauteur/2+7.5])
   rotate([0,0,90])
   passage_ecrou_m3();

    translate([x_cent_tige,5.5,hauteur/2])
    cylinder(h=hauteur+2,d=trou_de_vis_3,$fn=facettes);
       
 // vis de serrage courroie 1
    translate([19,-4.5,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([15,-21,-1])
        cylinder(h=hauteur+2,d=trou_de_vis_3,$fn=facettes);
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
// Ecrous bas
    translate([15,-4.5,hauteur/3+2.5])
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
    translate([15,-4.5,2*hauteur/3-epaisseur_ecrou_3-2.5])
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

// Attaches courroie
translate([10,-25.5,hauteur/3-8])
difference()
{
    //serrage de la courroie
    
            linear_extrude(height=6)
                square([14,25.5]);
    //courroie 1
    color("blue")
    translate([-0.01,9,6.0-0.63])
        cube([20,6.51 ,0.64]);

    translate([0.01,15.51,6.01])
    {
        rotate([0,-180,180])
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
    translate([9,21,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([5,4.5,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    translate([-10,25.5,-0.01])
    cylinder(h=6.02,d=25,$fn=facettes);
}

translate([10,-25.5,2*hauteur/3+2])
difference()
{
    //serrage de la courroie
    
            linear_extrude(height=6)
                square([14,25.5]);
    
    translate([9,21,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([5,4.5,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    translate([-10,25.5,-0.01])
    cylinder(h=6.02,d=25,$fn=facettes);
}

translate([10,-25.5,2*hauteur/3+2+6+2])
difference()
{
    //serrage de la courroie
    
            linear_extrude(height=6)
                square([14,25.5]);
    //courroie 1
    color("blue")
    translate([-0.01,9,-0.01])
        cube([20,6.51 ,0.65]);

    translate([20.01,15.51,0])
    {
        rotate([0,0,180])
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
    translate([9,21,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    // vis de serrage courroie 2   
    translate([5,4.5,-0.01])
        cylinder(h=6.02,d=trou_de_vis_3,$fn=facettes);
    translate([-10,25.5,-0.01])
    cylinder(h=6.02,d=25,$fn=facettes);
}

module passage_ecrou_m3()
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