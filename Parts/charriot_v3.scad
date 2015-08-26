decalage_origine=-16;
entraxe = 45;
diametre_passage = 24;
hauteur_charriot = entraxe + diametre_passage;

taille_x = 60;
taille_y = entraxe + diametre_passage;
//glissière
diam_bague = 15.9;
prof_bague=12.5;
chanfrein = 0.5;
diam_tige=10;
facettes = 50;

diametre_entree = 8.5;

diam_pions_centrage = 4;

largeur_ecrou_3 = 5.8;
hauteur_ecrou_3 = 6.5;
epaisseur_ecrou_3 = 3;
entraxe_attache = 15;
entraxe_tubes = 18;


 difference()
{  
 union()
        {    
translate([-diametre_passage/2,-diametre_passage/2,-diametre_passage/2])
                cube ([taille_x,diametre_passage,hauteur_charriot]);      
translate([-diametre_passage/2,-taille_x/2,-diametre_passage/2])
                cube ([diametre_passage,taille_x,hauteur_charriot]);  
        }   
        
     translate([-diametre_passage/2,0,30])
        rotate([0,90,0]) 
            extrusion_1();
    translate([-diametre_passage/2,0,0])
        rotate([0,90,0]) 
            extrusion_1(); 
    translate([0,-taille_x/2,15])
        rotate([-90,90,0]) 
            extrusion_1();    
    translate([0,-taille_x/2,45])
        rotate([-90,90,0]) 
            extrusion_1();
   }   

/*
difference()
{
    translate([-taille_x/2,-taille_y/2,-hauteur_charriot/2])
    {
        union()
        {
            translate([0,0,5])
            cube ([taille_x,taille_y,hauteur_charriot
            ]);
            /*
            translate([0,diametre_passage/2,hauteur_charriot/2])
                cube ([taille_x,entraxe,hauteur_charriot/2]);
            translate([0,diametre_passage/2,entraxe/2+diametre_passage/2])
                rotate([0,90,0]) 
                    cylinder(h=taille_x,d=diametre_passage,$fn=facettes);
            translate([0,0,hauteur_charriot-diametre_passage])
                cube ([taille_x,diametre_passage/2,diametre_passage/2]);
            
            translate([0,taille_x-diametre_passage/2,entraxe/2+diametre_passage/2])
                rotate([0,90,0]) 
                    cylinder(h=taille_x,d=diametre_passage,$fn=facettes);
            translate([0,taille_x-diametre_passage/2,hauteur_charriot-diametre_passage])
                cube ([taille_x,diametre_passage/2,diametre_passage/2]);
        
        }
    }

    //Ecrous d'attache
    
    for ( i = [-1 : 1] )
    {
        translate([taille_x/2-6,i*entraxe_attache,-hauteur_charriot/2 + epaisseur_ecrou_3])
            ecrou_m3(10);
        translate([taille_x/2-6,i*entraxe_attache,-hauteur_charriot/2 - 0.01])
            cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
    }
    for ( i = [-1 : 1] )
    {
        translate([-taille_x/2+8,i*entraxe_attache,-hauteur_charriot/2 + epaisseur_ecrou_3])
            rotate([0,0,180])
                ecrou_m3(10);
        translate([-taille_x/2+6,i*entraxe_attache,-hauteur_charriot/2 - 0.01])
            cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
    }
    
    translate([taille_x/2-8,0,hauteur_charriot/2 - 2*epaisseur_ecrou_3])
        ecrou_m3(10);
    translate([taille_x/2-6,0,hauteur_charriot/2 - 3 *epaisseur_ecrou_3])
        cylinder(h=epaisseur_ecrou_3*3+0.01,d=3.5,$fn=facettes);
    translate([-taille_x/2+8,0,hauteur_charriot/2 - 2*epaisseur_ecrou_3])
        rotate([0,0,180])
            ecrou_m3(10);
    translate([-taille_x/2+6,0,hauteur_charriot/2 - 3*epaisseur_ecrou_3])
        cylinder(h=epaisseur_ecrou_3*3+0.01,d=3.5,$fn=facettes);
    
    rotate([0,0,90])
    {
        
        translate([taille_x/2-8,0,-hauteur_charriot/2 + epaisseur_ecrou_3])
            ecrou_m3(10);
        translate([taille_x/2-6,0,-hauteur_charriot/2 - 0.01])
            cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
        translate([-taille_x/2+8,0,-hauteur_charriot/2 + epaisseur_ecrou_3])
            rotate([0,0,180])
                ecrou_m3(10);
        translate([-taille_x/2+6,0,-hauteur_charriot/2 - 0.01])
            cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
        
        for ( i = [-1 : 1] )
        {
            translate([taille_x/2-6,i*entraxe_attache,hauteur_charriot/2 - 2*epaisseur_ecrou_3])
                ecrou_m3(10);
            translate([taille_x/2-6,i*entraxe_attache,hauteur_charriot/2 - 3*epaisseur_ecrou_3 +0.01])
                cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
        }
        
        for ( i = [-1 : 1] )
        {
            translate([-taille_x/2+8,i*entraxe_attache,hauteur_charriot/2 - 2*epaisseur_ecrou_3])
                rotate([0,0,180])
                    ecrou_m3(10);
            translate([-taille_x/2+6,i*entraxe_attache,hauteur_charriot/2 - 3*epaisseur_ecrou_3 +0.01])
                cylinder(h=epaisseur_ecrou_3*3,d=3.5,$fn=facettes);
        }
    }
    
    translate([-taille_x/2,-20,15])
        rotate([0,90,0]) 
            extrusion_1();
    translate([-taille_x/2,-20,-15])
        rotate([0,90,0]) 
            extrusion_1(); 
    translate([0,taille_y/2,0])
        rotate([90,90,0]) 
            extrusion_1();    
    translate([0,taille_y/2,30])
        rotate([90,90,0]) 
            extrusion_1();
 
    translate([0,entraxe_tubes/2,-hauteur_charriot/2-1])
        cylinder(h=hauteur_charriot+2,d=diametre_entree,$fn=facettes);  
   translate([0,-entraxe_tubes/2,-hauteur_charriot/2-1])
        cylinder(h=hauteur_charriot+2,d=diametre_entree,$fn=facettes); 
    translate([-taille_x/2,-taille_y/2,-hauteur_charriot/2])
    {
        // centrage
        translate([taille_x/2+2,taille_y/2,-0.01])
        cylinder(h=5.01,d=diam_pions_centrage,$fn=facettes);
        translate([taille_x/2-10,taille_y/2-entraxe_tubes/2,-0.01])
        cylinder(h=5.01,d=diam_pions_centrage,$fn=facettes);
        translate([taille_x/2-10,taille_y/2+entraxe_tubes/2,-0.01])
        cylinder(h=5.01,d=diam_pions_centrage,$fn=facettes);
        // attache
        translate([taille_x/2-6,taille_y/2,-0.01])
        cylinder(h=hauteur_charriot+.02,d=diam_pions_centrage,$fn=facettes);
        
        // autres attaches
        translate([taille_x/2+10,taille_y/2,-0.01])
        cylinder(h=hauteur_charriot+.02,d=diam_pions_centrage,$fn=facettes);
        translate([taille_x/2+10,taille_y/2-10,-0.01])
        cylinder(h=hauteur_charriot+.02,d=diam_pions_centrage,$fn=facettes);
        translate([taille_x/2+10,taille_y/2+10,-0.01])
        cylinder(h=hauteur_charriot+.02,d=diam_pions_centrage,$fn=facettes);
    }
 }
 
 */
 
 module extrusion_1()
 {
     rotate_extrude($fn=facettes) 
        polygon( points=
        [[0,taille_x+1],//0
        [diam_bague/2+chanfrein,taille_x+1],//1
        [diam_bague/2+chanfrein,taille_x],//2
        [diam_bague/2,taille_x-chanfrein],//3
        [diam_bague/2,taille_x-prof_bague+chanfrein],//4
        [diam_bague/2-chanfrein,taille_x-prof_bague],//5
        [diam_tige/2+0.5+chanfrein,taille_x-prof_bague],//6
        [diam_tige/2+0.5,taille_x-prof_bague-chanfrein],//7
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
 


module ecrou_m3(profondeur_ecrou3)
{
   largeur_ecrou_3 = 5.8;
    hauteur_ecrou_3 = 6.5;
    epaisseur_ecrou_3 = 3;
    
    translate([0,-largeur_ecrou_3/2,0])
        cube([hauteur_ecrou_3+profondeur_ecrou3,largeur_ecrou_3 ,epaisseur_ecrou_3]);
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
