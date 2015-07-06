largeur = 40;
hauteur = 40;
epaisseur = 20;
diam_trou_fil = 2;
rayon_trou_fil = diam_trou_fil/2;
entraxe_fil = 18;
y_fil = 6;
facettes = 50;
diam_m5 = 5;
diam_tube_8 = 8;
rayon_tube_8 = diam_tube_8/2;
profondeur_tube = 10;
z_axe_serrage = hauteur - 5;

profondeur_trou_buse = 14;
diametre_trou_buse = 7;
rayon_trou_buse = diametre_trou_buse/2;

diam_pions_centrage = 4;
chanfrein = .5;

profondeur_ailette_1 = 8;
profondeur_ailette_2 = 10;

diam_attache = 3;

difference()
{
    
    //Passage des tubes
    cube([largeur,epaisseur,hauteur]);
    translate([(largeur-entraxe_fil)/2,y_fil,0])
        extrusion_1();
    translate([(largeur-entraxe_fil)/2+entraxe_fil,y_fil,0])
        extrusion_1();
    //serrage des tubes
    
    translate([(largeur-entraxe_fil)/2,-0.01,z_axe_serrage ])
        rotate([-90,0,0])
            cylinder(h=rayon_tube_8+0.02,d=3,$fn=facettes);
    translate([(largeur-entraxe_fil)/2+entraxe_fil,-0.01,z_axe_serrage ])
        rotate([-90,0,0])
            cylinder(h=rayon_tube_8+0.02,d=3,$fn=facettes);
    
    translate([(largeur-entraxe_fil)/2,-0.01,z_axe_serrage ])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);
    translate([(largeur-entraxe_fil)/2+entraxe_fil,-0.01,z_axe_serrage ])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);
            
    /*
    translate([-0.01,y_fil,z_axe_serrage ])
        rotate([0,90,0])
            cylinder(h=rayon_tube_8*2+0.02,d=3,$fn=facettes);
    translate([largeur+0.01,y_fil,z_axe_serrage ])
        rotate([0,-90,0])
            cylinder(h=rayon_tube_8*2+0.02,d=3,$fn=facettes);
            */
    // ailettes
    for ( i = [0 : 4] )
    {
        translate([-0.01,12,1.25+3*i])
            cube([largeur+0.02,profondeur_ailette_1+.01,1.5]);
    }
    for ( i = [0 : 3] )
    {
        translate([-0.01,10,16.25+3*i])
            cube([largeur+0.02,profondeur_ailette_2+.01,1.5]);
    }
    for ( i = [0 : 2] )
    {
        translate([-0.01,12,28.25+3*i])
            cube([largeur+0.02,profondeur_ailette_1+.01,1.5]);
    }
 
    // centrage
    translate([largeur/2,y_fil-2,38])
    cylinder(h=2.01,d=diam_pions_centrage,$fn=facettes);
    translate([4,epaisseur-(y_fil-2),38])
    cylinder(h=2.01,d=diam_pions_centrage,$fn=facettes);
    translate([largeur-4,epaisseur-(y_fil-2),38])
    cylinder(h=2.01,d=diam_pions_centrage,$fn=facettes);
    
    // attache
    translate([largeur/2,y_fil*2,35])
    cylinder(h=5.01,d=diam_attache,$fn=facettes);
    
    //Serrage buses
    translate([(largeur-entraxe_fil)/2,-0.01,11])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);
    translate([(largeur-entraxe_fil)/2,-0.01,3])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);
    translate([(largeur-entraxe_fil)/2+entraxe_fil,-0.01,11])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);
    translate([(largeur-entraxe_fil)/2+entraxe_fil,-0.01,3])
        rotate([-90,0,0])
            cylinder(h=epaisseur+0.02,d=3,$fn=facettes);

    //attache ventilateur
    translate([(y_fil-2),8,(y_fil-2)])
        rotate([-90,0,0])
            cylinder(h=20,d=diam_attache,$fn=facettes);
    translate([(y_fil-2),8,hauteur-(y_fil-2)])
        rotate([-90,0,0])
            cylinder(h=20,d=diam_attache,$fn=facettes);
    translate([largeur-(y_fil-2),8,(y_fil-2)])
        rotate([-90,0,0])
            cylinder(h=20,d=diam_attache,$fn=facettes);
    translate([largeur-(y_fil-2),8,hauteur-(y_fil-2)])
        rotate([-90,0,0])
            cylinder(h=20,d=diam_attache,$fn=facettes);

}

module extrusion_1()
 {
     rotate_extrude($fn=facettes) 
        polygon( points=
        [[0,hauteur+1],//0
        [rayon_tube_8+chanfrein,hauteur+1],//1
        [rayon_tube_8+chanfrein,hauteur],//2
        [rayon_tube_8,hauteur-chanfrein],//3
        [rayon_tube_8,hauteur-profondeur_tube],//4
        [rayon_trou_fil+chanfrein,hauteur-profondeur_tube],//5
        [rayon_trou_fil,hauteur-profondeur_tube-chanfrein],//6
        [rayon_trou_fil,profondeur_trou_buse+chanfrein],//7
        [rayon_trou_fil,profondeur_trou_buse], //8
        [rayon_trou_buse,profondeur_trou_buse],//9
        [rayon_trou_buse,chanfrein],//10
        [rayon_trou_buse+chanfrein,0], //11
        [rayon_trou_buse+chanfrein,-1],//12
        [0,-1]//13
        ]);
 }


 
