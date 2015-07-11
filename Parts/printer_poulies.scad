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
// cadre
color("purple")
{
    //arriere gauche
    translate([-barre_dim/2,-barre_dim/2,-400])
        cube([barre_dim,barre_dim,455]);
    //arriere droite
    translate([-barre_dim/2,largeur_interne+barre_dim/2,-400])
        cube([barre_dim,barre_dim,455]);
    //devant gauche
    translate([largeur_interne+barre_dim/2,-barre_dim/2,-400])
        cube([barre_dim,barre_dim,455]);
    //devant droite
    translate([largeur_interne+barre_dim/2,largeur_interne+barre_dim/2,-400])
        cube([barre_dim,barre_dim,455]);
}
    
//barres 2020
color("silver")
{
//barre axe X bas
    //gauche
    translate([barre_dim/2,-barre_dim/2,-35])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_interne]);
    //droite
    translate([barre_dim/2,largeur_interne+barre_dim/2,-35])
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
    translate([barre_dim/2,-barre_dim/2,-400])
        rotate([0,90,0])
            cube([barre_dim*3,barre_dim,largeur_interne]); 
    // droite
    translate([barre_dim/2,largeur_interne+barre_dim/2,-400])
        rotate([0,90,0])
            cube([barre_dim*3,barre_dim,largeur_interne]); 
}  
color("grey")
{
//barre axe X base 
    // derriere
    translate([-barre_dim/2,-barre_dim/2,-400])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim*3,largeur_interne+barre_dim*2]); 
    // devant
    translate([largeur_interne+barre_dim/2,-barre_dim/2,-400])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim*3,largeur_interne+barre_dim*2]); 
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
translate([barre_dim/2+largeur_interne/2-largeur_plateau/2,barre_dim/2+largeur_interne/2-largeur_plateau/2,-75])
cube([largeur_plateau,largeur_plateau,3]);
translate([barre_dim/2+largeur_interne/2-largeur_plateau/2,barre_dim/2+largeur_interne/2-largeur_plateau/2,-375])
cube([largeur_plateau,largeur_plateau,3]);
}

largeur_support = largeur_plateau + 50;
translate([barre_dim/2+largeur_interne/2-largeur_support/2,barre_dim/2+largeur_interne/2-largeur_support/2,-90])
cube([largeur_support,largeur_support,16]);
translate([barre_dim/2+largeur_interne/2-largeur_support/2,barre_dim/2+largeur_interne/2-largeur_support/2,-390])
cube([largeur_support,largeur_support,16]);

// roulements des axes
translate([barre_dim/2+18,0,0])
rotate([90,0,90])
KP000();
translate([barre_dim/2+largeur_interne-18,0,0])
rotate([90,0,-90])
KP000();

translate([0,barre_dim/2+18,20])
rotate([-90,0,0])
KP000();
translate([0,barre_dim/2+largeur_interne-18,20])
rotate([90,0,0])
KP000();


//screw axe z
milieu = barre_dim/2+largeur_interne/2;
translate([milieu,barre_dim/2+15,-35-barre_dim/2])
rotate([-90,90,0])
KP08();
translate([milieu,barre_dim/2+largeur_interne-15,-35-barre_dim/2])
rotate([90,90,0])
KP08();

translate([milieu,barre_dim/2+15,-400-barre_dim/2])
rotate([-90,90,0])
KP08();
translate([milieu,barre_dim/2+largeur_interne-15,-400-barre_dim/2])
rotate([90,90,0])
KP08();

translate([milieu,barre_dim/2+15,-400-barre_dim])
cylinder(h = 400,d=12,$fn=facettes);
translate([milieu,barre_dim/2+largeur_interne-15,-400-barre_dim])
cylinder(h = 400,d=12,$fn=facettes);

translate([milieu,barre_dim/2+15,-110])
    rotate([0,0,0])
        SFU1204_nut();
translate([milieu,barre_dim/2+largeur_interne-15,-110])
    rotate([0,0,0])
        SFU1204_nut();
translate([milieu,barre_dim/2+15,-115])
    support_nut();
translate([milieu,barre_dim/2+largeur_interne-15,-115])
    rotate([0,0,180])
        support_nut();


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
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,-400-barre_dim/2])
    rotate([-90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,-400-barre_dim/2])
    rotate([-90,90,0])
        SK10();
// haut gauche
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,-35-barre_dim/2])
    rotate([-90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,-35-barre_dim/2])
    rotate([-90,90,0])
        SK10();
// bas droite
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,-400-barre_dim/2])
    rotate([90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,-400-barre_dim/2])
    rotate([90,90,0])
        SK10();
// haut droite
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,-35-barre_dim/2])
    rotate([90,90,0])
        SK10();
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,-35-barre_dim/2])
    rotate([90,90,0])
        SK10();
        
color("green")
{
translate([milieu_X-largeur_support/2+retrait_X,barre_dim/2+dist_axe,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([milieu_X+largeur_support/2-retrait_X,barre_dim/2+dist_axe,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([milieu_X+largeur_support/2-retrait_X,largeur_interne+barre_dim/2-dist_axe,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
translate([milieu_X-largeur_support/2+retrait_X,largeur_interne+barre_dim/2-dist_axe,-400-barre_dim/2-7])
cylinder(h = 400,d=10,$fn=facettes);
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

module support_nut()
{
    color("cyan")
    translate([-40,-15,0])
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
            cylinder(h=5.02,d=12.5,$fn=facettes);
        translate([24,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
        translate([56,15,-0.01])
            cylinder(h=5.02,d=4.5,$fn=facettes);
    }
}
// support plateau
extremite = barre_dim/2+(largeur_interne-largeur_support)/2;
color("silver")
{
//barre axe X
    //gauche
    translate([extremite,extremite,-90])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_support]);
    //droite
    translate([extremite,extremite+largeur_support-barre_dim,-90])
        rotate([0,90,0])
            cube([barre_dim,barre_dim,largeur_support]);
}
color("grey")
{
//barre axe Y
    //derriere
    translate([extremite,extremite+barre_dim,-90])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_support-barre_dim*2]);
    //devant
    translate([extremite+largeur_support-barre_dim,extremite+barre_dim,-90])
        rotate([-90,0,0])
            cube([barre_dim,barre_dim,largeur_support-barre_dim*2]);
}
