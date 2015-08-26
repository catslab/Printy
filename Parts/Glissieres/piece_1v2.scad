

//Partie tenant les diam_tiges
largeur = 23;
hauteur=60;
diam_tige=10;
jeu_tige=0.1;
trou_de_vis_3 = 3.5;
largeur_ecrou_3 = 5.8;
epaisseur_ecrou_3 = 3;
profondeur_trou_vis_3 = 20;
x_cent_tige = 13;
z_cent_tige = 10;
//glissière
diam_bague = 15.9;
prof_bague=12.5;
chanfrein = 0.5;

facettes=50;
color("red")
//translate([0,0,largeur/2])
//rotate([0,-90,0])

difference(){
    // BLoc principal
    union() {
    translate([largeur*1.5,largeur/2,0])
    cylinder(h=hauteur,r=largeur/2,$fn=facettes);
    //translate([-largeur,-largeur/2,0])
    linear_extrude(height=hauteur)
    square([largeur+largeur/2,largeur]);
    }
    //trou no 1
    translate([x_cent_tige,largeur+1,hauteur-z_cent_tige])
    rotate([90,0,0])
    cylinder(h=largeur+2,r=(diam_tige+jeu_tige)/2,$fn=facettes);
    //trou no 2
    translate([x_cent_tige,largeur+1,z_cent_tige])
    rotate([90,0,0])
    cylinder(h=largeur+2,r=(diam_tige+jeu_tige)/2,$fn=facettes);
    // Coche no 2
    translate([4,-largeur/2-1,49])
    rotate([90,0,90])
    linear_extrude(height=15)
    square([largeur+2,2]);
    // Coche no 2
    translate([4,-largeur/2-1,9])
    rotate([90,0,90])
    linear_extrude(height=15)
    square([largeur+2,2]);
    //trou Vis de serrage 1
    translate([7.25,0,-1])
    cylinder(h=21,r=trou_de_vis_3/2,$fn=facettes);
    //trou Vis de serrage 2
    translate([7.25,0,40])
    cylinder(h=21,r=trou_de_vis_3/2,$fn=facettes);
    // Passage ecrou 1
    translate([largeur/2-largeur_ecrou_3-1,-largeur_ecrou_3/2,
hauteur-epaisseur_ecrou_3-diam_tige*1.5])
    rotate([90,0,90])
    linear_extrude(height=10)
    square([largeur_ecrou_3,epaisseur_ecrou_3]);
    // Passage ecrou 2
    translate([largeur/2-largeur_ecrou_3-1,-largeur_ecrou_3/2,diam_tige*1.5])
    rotate([90,0,90])
    linear_extrude(height=10)
    square([largeur_ecrou_3,epaisseur_ecrou_3]);
    translate([-largeur,0,0])
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
}

