diametre_poulie = 20.3;
diametre_axe= 17.5;
epaisseur_poulie = 18.5;
epaisseur_axe = 9;
epaisseur_flanc = 1.5;
diametre_flanc = 25;
facettes= 50;

barre_dim = 20;

axe_diam = 10;

largeur_interne = 440;
largeur_charriot = 60;
longueur_guide = 400;

largeur_plateau = 320;
long_glissiere_plateau = 400;

hauteur_cage = 430;
hauteur_profile = hauteur_cage + 55;

hauteur_barre_X_bas = -45;
longueur_sfu = 420;

hauteur_plateau = 0;

// cadre
color("purple")
{
    //arriere gauche
    translate([-barre_dim/2,-barre_dim/2,-hauteur_cage])
        cube([barre_dim,barre_dim,hauteur_profile]);
    //arriere droite
    translate([-barre_dim/2,largeur_interne+barre_dim/2,-hauteur_cage])
        cube([barre_dim,barre_dim,hauteur_profile]);
    //devant gauche
    translate([largeur_interne+barre_dim/2,-barre_dim/2,-hauteur_cage])
        cube([barre_dim,barre_dim,hauteur_profile]);
    //devant droite
    translate([largeur_interne+barre_dim/2,largeur_interne+barre_dim/2,-hauteur_cage])
        cube([barre_dim,barre_dim,hauteur_profile]);
}
    
//barres 2020
color("silver")
{
//barre axe X bas
    //gauche
    translate([barre_dim/2,-barre_dim/2,hauteur_barre_X_bas])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_interne]);
    //droite
    translate([barre_dim/2,largeur_interne+barre_dim/2,hauteur_barre_X_bas])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_interne]);
//barre axe Y bas   
    //derriere    
    translate([-barre_dim/2,barre_dim/2,-20])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_interne]);
    //devant    
    translate([largeur_interne+barre_dim/2,barre_dim/2,-20])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_interne]);
    
//barre axe X haut
    //gauche    
    translate([barre_dim/2,-barre_dim/2,35+barre_dim])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_interne]);  
       
//barre axe X base 
    // gauche
    translate([barre_dim/2,-barre_dim/2,-hauteur_cage])
        rotate([0,90,0])
            cube([barre_dim*4,barre_dim,largeur_interne]); 
    // droite
    translate([barre_dim/2,largeur_interne+barre_dim/2,-hauteur_cage])
        rotate([0,90,0])
            cube([barre_dim*4,barre_dim,largeur_interne]); 
}  
color("grey")
{
//barre axe X base 
    // derriere
    translate([-barre_dim/2,-barre_dim/2,-hauteur_cage])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim*4,largeur_interne+barre_dim*2]); 
    // devant
    translate([largeur_interne+barre_dim/2,-barre_dim/2,-hauteur_cage])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim*4,largeur_interne+barre_dim*2]); 
}
// axes de transmission
color("red")
{
    //X0
    translate([18+barre_dim/2,-30.01,0])
    rotate([-90,0,0])
    cylinder(h = largeur_interne + largeur_charriot,
        d=axe_diam,$fn=facettes);
    //Y0
    translate([-10,18+barre_dim/2,20])
    rotate([0,90,0])
    cylinder(h = largeur_interne + largeur_charriot,
        d=axe_diam,$fn=facettes);
    //Xmax
    translate([20+largeur_interne-18-barre_dim/2,-30.01,0])
    rotate([-90,0,0])
    cylinder(h = largeur_interne + largeur_charriot,
        d=axe_diam,$fn=facettes);
    //Ymax
    translate([-30.01,20+largeur_interne-18-barre_dim/2,20])
    rotate([0,90,0])
    cylinder(h = largeur_interne + largeur_charriot,
        d=axe_diam,$fn=facettes);
}
//poulie 32T
// axe Y X0
// entrainement
translate([18+barre_dim/2,-epaisseur_poulie-barre_dim/2,0])
rotate([-90,0,0])
{
    poulie_32();
}
// poulie Y0
translate([18+barre_dim/2,barre_dim/2,0])
rotate([-90,0,0])
{
    poulie_32();
}
// poulie Ymax
translate([18+barre_dim/2,barre_dim/2,0])
rotate([-90,0,0])
{
    poulie_32();
}
// axe Y X0 
// poulie Ymax
translate([barre_dim/2+18,largeur_interne+barre_dim/2,0])
rotate([90,0,0])
{
   poulie_32();
}
// axe X Y0 
// poulie Xmax

translate([largeur_interne+barre_dim/2,18+barre_dim/2,20])
rotate([0,-90,0])
{
   poulie_32();
}
// poulie X0
translate([barre_dim/2,18+barre_dim/2,20])
rotate([0,90,0])
{
   poulie_32();
}
// axe X Ymax 
// entrainement
translate([-epaisseur_poulie-barre_dim/2,20+largeur_interne-18-barre_dim/2,20])
rotate([0,90,0])
{
    poulie_32();
}
// poulie X0
translate([barre_dim/2,20+largeur_interne-18-barre_dim/2,20])
rotate([0,90,0])
{
   poulie_32();
}
// poulie Xmax
translate([largeur_interne+barre_dim/2,20+largeur_interne-18-barre_dim/2,20])
rotate([0,-90,0])
{
   poulie_32();
}
// axe Y Xmax 
// poulie Y0
translate([20+largeur_interne-18-barre_dim/2,barre_dim/2,0])
rotate([-90,0,0])
{
    poulie_32();
}
// poulie Ymax
translate([20+largeur_interne-18-barre_dim/2,largeur_interne+barre_dim/2,0])
rotate([90,0,0])
{
    poulie_32();
}


//Supports de translation
translate([80,28,20])
rotate([0,90,0])
import("piece_1v5.stl");
translate([28,80,0])
rotate([270,-90,0])
import("piece_1v5.stl");
translate([440+20-28,largeur_charriot+80,0])
rotate([90,270,0])
import("piece_1v5.stl");
translate([largeur_charriot+80,440+20-28,20])
rotate([00,90,180])
import("piece_1v5.stl");

color("black")
{
    //parallèle a  X
    translate([18+barre_dim/2,10+epaisseur_flanc+0.25,20.3/2])
    cube([largeur_interne-36,6,0.63]);
    translate([18+barre_dim/2,10+epaisseur_flanc+0.25,-0.63-20.3/2])
    cube([largeur_interne-36,6,0.63]);
    translate([18+barre_dim/2,largeur_interne+10-(6+epaisseur_flanc+0.25),20.3/2])
    cube([largeur_interne-36,6,0.63]);
    translate([18+barre_dim/2,largeur_interne+10-(6+epaisseur_flanc+0.25),-0.63-20.3/2])
    cube([largeur_interne-36,6,0.63]);

    //parallèle a  Y
    rotate([0,0,90])
    {
        translate([18+barre_dim/2,-10-epaisseur_flanc-0.25-6,20+20.3/2])
            cube([largeur_interne-36,6,0.63]);
        translate([18+barre_dim/2,-10-epaisseur_flanc-0.25-6,20-0.63-20.3/2])
            cube([largeur_interne-36,6,0.63]);
    }
        translate([largeur_interne+10-(epaisseur_flanc+0.25+6),18+barre_dim/2,20+20.3/2])
    cube([6,largeur_interne-36,0.63]);
    translate([largeur_interne+10-(epaisseur_flanc+0.25+6),18+barre_dim/2,20-0.63-20.3/2])
    cube([6,largeur_interne-36,0.63]);
}

//axes de charriot
color("green")
{
translate([90,10+18+12-10,0])
rotate([-90,0,0])
cylinder(h = longueur_guide,
    d=axe_diam, center=false,$fn=facettes);
translate([130,10+18+12-10,0])
rotate([-90,0,0])
cylinder(h = longueur_guide,
    d=axe_diam, center=false,$fn=facettes);
    
translate([10+18+12-10,90,20])
rotate([0,90,0])
cylinder(h = longueur_guide,
    d=axe_diam, center=false,$fn=facettes);
translate([10+18+12-10,130,20])
rotate([0,90,0])
cylinder(h = longueur_guide,
    d=axe_diam, center=false,$fn=facettes);
}

color("pink")
translate([80+30,80+30,10])
rotate([0,0,180])
    import("charriot.stl");
color("silver")
translate([80+24,80+50,-52])
rotate([0,0,-90])
import("bloc_impression.stl");

//Plateau
color("grey")
{
translate([barre_dim/2+largeur_interne/2-largeur_plateau/2,barre_dim/2+largeur_interne/2-largeur_plateau/2,hauteur_plateau-75])
cube([largeur_plateau,largeur_plateau,3]);
/*
translate([barre_dim/2+largeur_interne/2-largeur_plateau/2,barre_dim/2+largeur_interne/2-largeur_plateau/2,-375])
cube([largeur_plateau,largeur_plateau,3]);
*/
}

largeur_support = largeur_plateau + 50;
translate([barre_dim/2+largeur_interne/2-largeur_support/2,barre_dim/2+largeur_interne/2-largeur_support/2,hauteur_plateau-90])
cube([largeur_support,largeur_support,16]);
/*
translate([barre_dim/2+largeur_interne/2-largeur_support/2,barre_dim/2+largeur_interne/2-largeur_support/2,-390])
cube([largeur_support,largeur_support,16]);
*/
// roulements des axes
translate([barre_dim/2+18,0,0])
rotate([90,0,90])
KP000();
translate([barre_dim/2+largeur_interne-18,0,0])
rotate([90,0,-90])
KP000();
translate([barre_dim/2+18,largeur_interne+barre_dim,0])
rotate([90,0,90])
KP000();
translate([barre_dim/2+largeur_interne-18,largeur_interne+barre_dim,0])
rotate([90,0,-90])
KP000();

translate([0,barre_dim/2+18,20])
rotate([-90,0,0])
KP000();
translate([0,barre_dim/2+largeur_interne-18,20])
rotate([90,0,0])
KP000();
translate([largeur_interne+barre_dim,barre_dim/2+18,20])
rotate([-90,0,0])
KP000();
translate([largeur_interne+barre_dim,barre_dim/2+largeur_interne-18,20])
rotate([90,0,0])
KP000();

//screw axe z
milieu = barre_dim/2+largeur_interne/2;
translate([milieu,barre_dim/2+15,hauteur_barre_X_bas-barre_dim/2])
rotate([-90,90,0])
KP08();
translate([milieu,barre_dim/2+largeur_interne-15,hauteur_barre_X_bas-barre_dim/2])
rotate([90,90,0])
KP08();

translate([milieu,barre_dim/2+15,-hauteur_cage-barre_dim*1.5])
rotate([-90,90,0])
KP08();
translate([milieu,barre_dim/2+largeur_interne-15,-hauteur_cage-barre_dim*1.5])
rotate([90,90,0])
KP08();

translate([milieu,barre_dim/2+15,-hauteur_cage-barre_dim*2+3])
cylinder(h = longueur_sfu,d=12,$fn=facettes);
translate([milieu,barre_dim/2+largeur_interne-15,-hauteur_cage-barre_dim*2+3])
cylinder(h = longueur_sfu,d=12,$fn=facettes);

translate([milieu,barre_dim/2+15,hauteur_plateau-125])
    rotate([0,0,0])
        SFU1204_nut();
translate([milieu,barre_dim/2+largeur_interne-15,hauteur_plateau-125])
    rotate([0,0,0])
        SFU1204_nut();
translate([milieu,barre_dim/2+15,hauteur_plateau-115])
    support_nut2();
translate([milieu,barre_dim/2+largeur_interne-15,hauteur_plateau-115])
    rotate([0,0,180])
        support_nut2();

epaisseur_KP08 = 13;
decalage_KP08 = 2;
translate([milieu,barre_dim/2+15,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+epaisseur_poulie])
rotate([180,0,0])
poulie_32();
translate([milieu,barre_dim/2+largeur_interne-15,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+epaisseur_poulie])
rotate([180,0,0])
poulie_32();

//soutient moteur Z   
color("silver")
{
    translate([milieu+30,barre_dim/2,-hauteur_cage-barre_dim])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_interne]);
     translate([milieu-barre_dim*2.5,barre_dim/2,-hauteur_cage-barre_dim])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_interne]);
    translate([milieu-barre_dim*1.5,barre_dim/2+largeur_interne/4,-hauteur_cage-barre_dim])
        rotate([-90,0,0])
            cube([3*barre_dim,barre_dim,largeur_interne/2]);
}

translate([milieu+barre_dim*2.5+21,milieu,-hauteur_cage-barre_dim-47])
moteur_pap();
translate([milieu+barre_dim*2.5+21,milieu,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9])
poulie_32();
color("black")
{
    //parallèle a  Y
    translate([milieu-20.3/2,10+15,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9+6+epaisseur_flanc+0.25])
    rotate([-90,0,90])
    cube([largeur_interne-30,6,0.63]);
    translate([milieu+20.3/2,10+15,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9+6+epaisseur_flanc+0.25])
    rotate([-90,0,90])
    cube([largeur_interne/2-20.3/2-15,6,0.63]);
    translate([milieu+20.3/2,10+largeur_interne/2+20.3/2,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9+6+epaisseur_flanc+0.25])
    rotate([-90,0,90])
    cube([largeur_interne/2-20.3/2-15,6,0.63]);
    
    translate([milieu+20.3/2,milieu-20.3/2,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9+6+epaisseur_flanc+0.25])
    rotate([-90,0,0])
    cube([40+21,6,0.63]);
    translate([milieu+20.3/2,milieu+20.3/2,-hauteur_cage-barre_dim*1.5+epaisseur_KP08/2+decalage_KP08+9+6+epaisseur_flanc+0.25])
    rotate([-90,0,0])
    cube([40+21,6,0.63]);
}

/*
//glissière plateau v1
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2-largeur_support/2,-400-barre_dim/2])
rotate([0,-90,0])
SK10();
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2+largeur_support/2,-400-barre_dim/2])
rotate([0,-90,0])
SK10();
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2-largeur_support/2,-20-barre_dim/2])
rotate([0,-90,0])
SK10();
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2+largeur_support/2,-20-barre_dim/2])
rotate([0,-90,0])
SK10();

translate([barre_dim*1.5,barre_dim/2+largeur_interne/2-largeur_support/2,-400-barre_dim/2])
rotate([0,90,0])
SK10();
translate([barre_dim*1.5,barre_dim/2+largeur_interne/2+largeur_support/2,-400-barre_dim/2])
rotate([0,90,0])
SK10();
translate([barre_dim*1.5,barre_dim/2+largeur_interne/2-largeur_support/2,-20-barre_dim/2])
rotate([0,90,0])
SK10();
translate([barre_dim*1.5,barre_dim/2+largeur_interne/2+largeur_support/2,-20-barre_dim/2])
rotate([0,90,0])
SK10();
color("green")
{
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2+largeur_support/2,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([largeur_interne-barre_dim/2,barre_dim/2+largeur_interne/2-largeur_support/2,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([barre_dim*1.5,barre_dim/2+largeur_interne/2-largeur_support/2,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([barre_dim*1.5,barre_dim/2+largeur_interne/2+largeur_support/2,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
}

*/
dist_axe = 20;
retrait_X=10;
milieu_X = barre_dim/2+largeur_interne/2;
//glissière plateau v2
// bas gauche
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,-hauteur_cage-barre_dim/2])
    rotate([-90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,-hauteur_cage-barre_dim/2])
    rotate([-90,90,0])
        SK10();
// haut gauche
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,hauteur_barre_X_bas-barre_dim/2])
    rotate([-90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,hauteur_barre_X_bas-barre_dim/2])
    rotate([-90,90,0])
        SK10();
// bas droite
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,-hauteur_cage-barre_dim/2])
    rotate([90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,-hauteur_cage-barre_dim/2])
    rotate([90,90,0])
        SK10();
// haut droite
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_barre_X_bas-barre_dim/2])
    rotate([90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_barre_X_bas-barre_dim/2])
    rotate([90,90,0])
        SK10();

ep_sk10 = 14;
        
color("green")
{
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,-hauteur_cage-barre_dim/2-ep_sk10/2])
cylinder(h = long_glissiere_plateau,d=10,$fn=facettes);
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,-hauteur_cage-barre_dim/2-ep_sk10/2])
cylinder(h = long_glissiere_plateau,d=10,$fn=facettes);
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,-hauteur_cage-barre_dim/2-ep_sk10/2])
cylinder(h = long_glissiere_plateau,d=10,$fn=facettes);
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,-hauteur_cage-barre_dim/2-ep_sk10/2])
cylinder(h = long_glissiere_plateau,d=10,$fn=facettes);
}

// glissieres sur les axes
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_plateau-121])
LMH10UU();
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_plateau-121])
LMH10UU();
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,hauteur_plateau-121])
LMH10UU();
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,hauteur_plateau-121])
LMH10UU();

translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_plateau-115])
    rotate([180,180,0])
        support_LMH10UU_2();
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,hauteur_plateau-110])
    rotate([180,0,0])
        support_LMH10UU_2();

translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,hauteur_plateau-110])
    rotate([0,180,0])
        support_LMH10UU_2();
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,hauteur_plateau-115])
    support_LMH10UU_2();

// support plateau
extremite = barre_dim/2+(largeur_interne-largeur_support)/2;
color("silver")
{
//barre axe X
    //gauche
    translate([extremite,extremite,hauteur_plateau-90])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_support]);
    //droite
    translate([extremite,extremite+largeur_support-barre_dim,hauteur_plateau-90])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_support]);
}
color("grey")
{
//barre axe Y
    //derriere
    translate([extremite,extremite+barre_dim,hauteur_plateau-90])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_support-barre_dim*2]);
    //devant
    translate([extremite+largeur_support-barre_dim,extremite+barre_dim,hauteur_plateau-90])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_support-barre_dim*2]);
}



module SK10() 
{ 
    color("olive")
    { 
        translate([-7,-21,-20])
        {
            difference()
            {
                union()
                {
                    cube([14,42,6]);
                    translate([0,12,0])
                        cube([14,18,37.5]);
                }
                translate([-0.01,21,20])
                    rotate([0,90,0])
                        cylinder(h = 18.02,d=10,$fn=facettes);
            }
        }
    }
}

 module KP08() 
 { 
    color("olive")
    { 
        translate([-6.5,-27.5,-15])
        {
            translate([0,27.5,15])
                rotate([0,90,0])
                    cylinder(h = 13,d=27,$fn=facettes);
            cube([13,55,5]);
            translate([0,14,0])
                cube([13,27,15]);
        }
    }
}

module poulie_32()
{
    translate([0,0,(epaisseur_poulie - epaisseur_axe)/2])
        cylinder(h = epaisseur_poulie - epaisseur_axe,d=diametre_poulie, center=true,$fn=facettes);
    translate([0,0,epaisseur_axe+(epaisseur_poulie -    epaisseur_axe)/2])
        cylinder(h = epaisseur_axe,d=diametre_axe, center=true,$fn=facettes);
    translate([0,0,epaisseur_flanc/2])
        cylinder(h = epaisseur_flanc,d=diametre_flanc, center=true,$fn=facettes);
    translate([0,0,epaisseur_flanc/2+epaisseur_flanc+6.5])
        cylinder(h = epaisseur_flanc,d=diametre_flanc, center=true,$fn=facettes);
}
    
module KP000() 
{
    color("olive")
    { 
        translate([-8,-33.5,-18])
        {
            translate([0,33.5,18.5])
                rotate([0,90,0])
                    cylinder(h = 16,d=33,$fn=facettes);
            cube([16,67,6]);
            translate([0,17,5])
                cube([16,33,16.5]);
        }
    }
}



module SFU1204_nut()
{
    color("blue")
    {
        difference()
        {
            union()
            {
                cylinder(h=10,d=40,$fn=facettes);
                translate([0,0,10])
                    cylinder(h=30,d=24,$fn=facettes);
            }
            translate([0,0,-0.01])
                cylinder(h=40.02,d=12,$fn=facettes);
             translate([-20,15,-0.01])
                cube([40,5,10.02]);
            translate([-20,-20,-0.01])
                cube([40,5,10.02]);
            translate([-16,0,-0.01])
                 cylinder(h=10.02,d=4.5,$fn=facettes);
            translate([16,0,-0.01])
                 cylinder(h=10.02,d=4.5,$fn=facettes);
        }
    }
}

module support_nut()
{
    color("cyan")
    {
        translate([-40,-15,0])
        {
            difference()
            {
                union()
                {
                    translate([20,0,0])
                        cube([40,35,5]);
                    translate([0,35,0])
                        cube([80,20,5]);
                }
                translate([10,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([30,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([50,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([70,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([40,15,-0.01])
                    cylinder(h=5.02,d=24.5,$fn=facettes);
                translate([24,15,-0.01])
                    cylinder(h=5.02,d=4.5,$fn=facettes);
                translate([56,15,-0.01])
                    cylinder(h=5.02,d=4.5,$fn=facettes);
            }
        }
    }
}


module support_LMH10UU()
{
    color("cyan")
    translate([-30,-15,0])
    difference()
    {

            cube([50,70,5]);
        translate([30,15,-0.01])
            cylinder(h=5.02,d=19.5,$fn=facettes);
        translate([15.5,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
        translate([44.5,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
        translate([10,40,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
        translate([30,40,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
        translate([30,60,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
    }
}


module support_LMH10UU_2()
{
    color("cyan")
    translate([-30,-15,0])
    difference()
    {
    union()
        {
            translate([0,30,0])
                cube([40,20,5]);
            translate([20,50,0])
                cube([20,40,5]);
            translate([10,15,0])
                cube([30,15,5]);
            translate([30,15,0])
                cylinder(h=5,d=40,$fn=facettes);
        }
        //LMH10
        translate([30,15,-0.01])
            cylinder(h=5.02,d=19.5,$fn=facettes);
        translate([15.5,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
        translate([44.5,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
        //Attache 2020
        translate([10,40,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
        translate([30,40,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
        translate([30,60,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
        translate([30,80,-0.01])
            cylinder(h=5.02,d=5.5,$fn=facettes);
    }
}


module LMH10UU()
{
    color("blue")
    difference()
    {
        union()
        {
            cylinder(h=6,d=40,$fn=facettes);
            cylinder(h=29,d=19,$fn=facettes);
        }
        translate([-20,12.5,-0.01])
            cube([40,8,6.02]);
        translate([-20,-12.5-8,-0.01])
            cube([40,8,6.02]);
        translate([-14.5,0,-0.01])
             cylinder(h=6.02,d=4.5,$fn=facettes);
        translate([-14.5,0,-0.01])
             cylinder(h=4.41,d=8,$fn=facettes);
        translate([14.5,-0.01])
             cylinder(h=6.02,d=4.5,$fn=facettes);
        translate([14.5,0,-0.01])
             cylinder(h=4.41,d=8,$fn=facettes);
        
    }
}




module support_nut2()
{
    color("cyan")
    {
        translate([-40,-15,0])
        {
            difference()
            {
                union()
                {
                    translate([18,18,0])
                        cube([44,17,5]);
                    translate([0,35,0])
                        cube([80,20,5]);
                    translate([40,16,0])
                         cylinder(h=5,d=44,$fn=facettes);
                }
                translate([10,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([30,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([50,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([70,45,-0.01])
                    cylinder(h=5.02,d=5.5,$fn=facettes);
                translate([40,15,-0.01])
                    cylinder(h=5.02,d=24.5,$fn=facettes);
                translate([24,15,-0.01])
                    cylinder(h=5.02,d=4.5,$fn=facettes);
                translate([56,15,-0.01])
                    cylinder(h=5.02,d=4.5,$fn=facettes);
            }
        }
    }
}

module moteur_pap()
{
    color("black")
    translate([-21,-21,0])
    cube([42,42,47]);
    color("grey")
    translate([0,0,47])
        cylinder(h=2,d=22,$fn=facettes);
    color("grey")
    translate([0,0,49])
        cylinder(h=21,d=5,$fn=facettes);
}
