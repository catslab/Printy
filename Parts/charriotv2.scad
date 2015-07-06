entraxe = 30;
hauteur_charriot = 44;
diametre_passage = 24;
taille_x = entraxe + diametre_passage;
taille_y = entraxe + diametre_passage;
//glissière
diam_bague = 15.9;
prof_bague=12.5;
chanfrein = 0.5;
diam_tige=10;
facettes = 50;

difference()
{
    translate([-taille_x/2,-taille_y/2,-hauteur_charriot/2])
    {
        union()
        {
            cube ([taille_x,taille_y,hauteur_charriot/2]);
            translate([0,diametre_passage/2,hauteur_charriot/2])
                cube ([taille_x,entraxe,hauteur_charriot/2]);
            
            translate([0,diametre_passage/2,hauteur_charriot-diametre_passage/2])
                rotate([0,90,0]) 
                    cylinder(h=taille_x,d=diametre_passage,$fn=facettes);
            translate([0,0,hauteur_charriot-diametre_passage])
                cube ([taille_x,diametre_passage/2,diametre_passage/2]);
            
            translate([0,taille_x-diametre_passage/2,hauteur_charriot-diametre_passage/2])
                rotate([0,90,0]) 
                    cylinder(h=taille_x,d=diametre_passage,$fn=facettes);
            translate([0,taille_x-diametre_passage/2,hauteur_charriot-diametre_passage])
                cube ([taille_x,diametre_passage/2,diametre_passage/2]);
        }
    }

    translate([-taille_x/2,entraxe/2,10])
    rotate([0,90,0]) 
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
    translate([-taille_x/2,-entraxe/2,10])
    rotate([0,90,0]) 
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

    
    translate([-entraxe/2,taille_y/2,-10])
    rotate([90,90,0]) 
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
        
         translate([entraxe/2,taille_y/2,-10])
    rotate([90,90,0]) 
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