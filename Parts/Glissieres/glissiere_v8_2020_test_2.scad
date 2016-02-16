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

cut = 40;

diff_trou = largeur+largeur/2 - (x_cent_tige+diam_tige/2);
$fn=200;

glissiere_v8();
//attache();
/*
translate([34.25,-18,8])
cube([2.75,18,27]);

translate([16,-16,8])
cube([2.75,16,27]);
*/


module empreinte_M4(){
    cote_k = 7;
    facteur =1.1547;
    cote_e = cote_k*facteur;
    clear = 0.25;
    linear_extrude(height = 10, center = true)
    circle(d = cote_e+clear, $fn=6, center=true);
}

module attache(){
color("green")
difference(){
    translate([-10+29,-18,30])
    cube([15,17.5,12]);

    translate([30-1+0.63,-10.5-6,30])
    rotate([0,-90,0])
    courroie();
    translate([30-1+0.63,-10.5-6-6.5,30])
    rotate([0,-90,0])
    courroie();
    
   color("black")
    translate([23,-10.25-3,3])
            cylinder(h=40,d=4.5);
}
}

module glissiere_v8(){

color("red")
difference()
{
    // BLoc principal
    union() 
    {

        cylinder(h=hauteur,r=largeur/2);
    
        translate([0,0,0])
            linear_extrude(height=hauteur)
                square([largeur/2+20+5,largeur/2]);
        /*
        translate([0,0,hauteur/3])
        linear_extrude(height=hauteur/3)
            polygon( points=
            [[0,3],//0
            [24,3],//1
            [24,-25.5],//2
            [10,-25.5],//3
            [0,-12],//4
            ]);
*/
translate([0,0,21])
linear_extrude(height=18)
            polygon( points=
            [[0,0],//0
            [14,0],//1
            [14,-17],//2
            [6,-17],//3
            [0,-12],//4
            //[12,0],//4
            ]);
    } // union
    
    //courroie
    translate([-0.63+10,-6.5-10.5,40])
rotate([0,90,0])
courroie();
    
     translate([-0.63+10,-6.5-17,40])
rotate([0,90,0])
courroie();
    
    // tension
   /* 
    color("black")
    translate([23,-10.25-3,3])
            cylinder(h=40,d=4.5);
    // ecrou
    translate([23,-10.25-3,6])
    rotate([0,0,90])
    empreinte_M4();
    
// courroie bas

 translate([30-1+0.63,-10.5-6,8])
    rotate([0,-90,0])
    courroie();
    translate([30-1+0.63,-10.5-6-6.5,8])
    rotate([0,-90,0])
    courroie();
*/
translate([2,0,5])
{    
translate([20,7,15])
    cube([20,10.02,20],center=true);
    
    translate([20,-0.01,15])
        rotate([-90,0,0])
            cylinder(h=12,d=4.5);
    
    translate([40,7+0.01,15])
        rotate([0,-90,0])
            cylinder(h=12,d=4.5);
     translate([20,7,-5.01])
            cylinder(h=12,d=4.5);
    translate([10.01,12.01,15+0.01])
        rotate([90,0,0])
    linear_extrude(height=largeur/2+0.02)
     polygon( points=
        [[cut,cut],//0
        [cut,0],//1
        [0,cut]
    ]);//2
    
    translate([20,7,25-0.01])
            cylinder(h=12,d=4.5);
    translate([20,7,30-0.01])
            cylinder(h=30,d=8.5);
        }
   
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
} // fin piece

}
module courroie(){
    //courroie 1
    color("blue")
    translate([-0.01,0,0.01])
        cube([20,6.51 ,0.64]);
color("blue")
    translate([0.01,0,0.01])
    {
        rotate([0,0,0])
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
                            cylinder(h,r,r);
                            translate ([0,-(r+e),-e]) cube([2*(r+e),2*(r+e),h+2*e]);
                        }
            }
        }
    }
}