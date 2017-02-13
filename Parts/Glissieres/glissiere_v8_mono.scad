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
diam_bague = 16;
prof_bague=12.5;
chanfrein = 0.5;

cut = 40;

diff_trou = largeur+largeur/2 - (x_cent_tige+diam_tige/2);
$fn=400;

glissiere_v8_single();


module empreinte_M3(){
    cote_k = 5.5;
    facteur =1.1547;
    cote_e = cote_k*facteur;
    clear = 0.25;
    linear_extrude(height = 3, center = true)
    circle(d = cote_e+clear, $fn=6, center=true);
}



module glissiere_v8_single(){

color("red")
difference()
{
    // BLoc principal
    union() 
    {

        cylinder(h=hauteur,r=largeur/2);
        //cube([largeur/2+20+5,largeur/2,hauteur]);
        translate([0,largeur/2,0])
            rotate([90,0,0])
                linear_extrude(height=largeur/2)
                    polygon( points=
                    [[0,0],//0
                    [largeur/2,0],//1
                    [largeur/2+20,hauteur/3],//2
                    [largeur/2+20,hauteur/3*2],//3
                    [largeur/2,hauteur],//1
                    [0,hauteur],//1
                    ]);
        
        //attache courroie
        translate([0,0,(hauteur-22)/2])
            linear_extrude(height=22)
                polygon( points=
                [[0,0],//0
                [14,0],//1
                [14,-16],//2
                [6,-16],//3
                [0,-12],//4
                ]);
    } // union
    
    //passage ecrou
    translate([28,largeur/4,hauteur/2])
        cube ([3.5,largeur/2+0.1,5.6],center=true);
    translate([36,largeur/4,hauteur/2])
    rotate([0,-90,0])
        cylinder(d=3.5,h=largeur/2);
    
    //axe
    translate([x_cent_tige,largeur/2+0.01,hauteur/2])
    rotate([90,0,0])
        cylinder(d=diam_tige+jeu_tige,h=largeur/2+0.1);
    
    //courroie
    translate([-0.63+10,-6.5-9.5,44])
    rotate([0,90,0])
        courroie();
    
    translate([-0.63+10,-6.5-16,44])
    rotate([0,90,0])
        courroie();

   
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
        [diam_tige/2+1+chanfrein,hauteur-prof_bague],//6
        [diam_tige/2+1,hauteur-prof_bague-chanfrein],//7
        [diam_tige/2+1,prof_bague+chanfrein], //8
        [diam_tige/2+1+chanfrein,prof_bague],
        [diam_bague/2-chanfrein,prof_bague],
        [diam_bague/2,prof_bague-chanfrein], //11
        [diam_bague/2,chanfrein],
        [diam_bague/2+chanfrein,0],
        [diam_bague/2+chanfrein,-1],
        [0,-1]
        ]);    
} // fin piece

}
module courroie(){
    //courroie 1
    color("blue")
        translate([-0.01,0,0.01-0.1])
        cube([30,6.51 ,0.74]);
    color("blue")
        translate([0.01,0,0.01-0.1])
        {
            rotate([0,0,0])
            {
                r=0.75;
                h=6.51;
                // small number
                e=.02;
                for ( i = [0 : 14] )
                {
                    translate([1+i*2,0,0.73])
                        rotate([-90,90,0])
                            difference()
                            {
                                cylinder(h,r,r);
                                translate ([0,-(r+e),-e]) cube([2*(r+e),2*(r+e),h+2*e]);
                            }
                }
            }
        }
}