diametre_poulie = 20.3;
diametre_axe= 17.5;
epaisseur_poulie = 18.5;
epaisseur_axe = 9;
epaisseur_flanc = 1.5;
diametre_flanc = 25;
facettes= 50;

barre_dim = 20;

axe_diam = 10;

color("blue")
cube([barre_dim,barre_dim,100],center=true);

color("red")
translate([18+barre_dim/2,100,0])
rotate([-90,0,0])
cylinder(h = 280,
    d=axe_diam, center=true,$fn=facettes);
color("red")
translate([100,18+barre_dim/2,20])
rotate([0,90,0])
cylinder(h = 300,
    d=axe_diam, center=true,$fn=facettes);
//poulie 32T

translate([18+barre_dim/2,-12,0])
rotate([90,0,0])
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

translate([18+barre_dim/2,barre_dim/2,0])
rotate([-90,0,0])
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
translate([barre_dim/2,18+barre_dim/2,20])
rotate([0,90,0])
{
    translate([0,0,(epaisseur_poulie - epaisseur_axe)/2])
cylinder(h = epaisseur_poulie - epaisseur_axe,
    d=diametre_poulie, center=true,$fn=facettes);
    translate([0,0,epaisseur_axe+(epaisseur_poulie - epaisseur_axe)/2])
cylinder(h = epaisseur_axe,
    d=diametre_axe, center=true,$fn=facettes);
    translate([0,0,epaisseur_flanc/2])
        cylinder(h = epaisseur_flanc,d=diametre_flanc, center=true,$fn=facettes);
    translate([0,0,epaisseur_flanc/2+epaisseur_flanc+6.5])
        cylinder(h = epaisseur_flanc,d=diametre_flanc, center=true,$fn=facettes);
}
translate([80,28,20])
rotate([0,90,0])
import("piece_1v5.stl");
translate([28,80,0])
rotate([270,-90,0])
import("piece_1v5.stl");

color("black")
{
    translate([28,10+epaisseur_flanc+0.25,20.3/2])
    cube([150,6,0.63]);
    translate([28,10+epaisseur_flanc+0.25,-0.63-20.3/2])
    cube([150,6,0.63]);
    rotate([0,0,90])
    {
        translate([28,-10-epaisseur_flanc-0.25-6,20+20.3/2])
            cube([150,6,0.63]);
        translate([28,-10-epaisseur_flanc-0.25-6,20-0.63-20.3/2])
            cube([150,6,0.63]);
    }
}

color("green")
{
translate([90,18+10-1+2,0])
rotate([-90,0,0])
cylinder(h = 280,
    d=axe_diam, center=false,$fn=facettes);
translate([130,18+10-1+2,0])
rotate([-90,0,0])
cylinder(h = 280,
    d=axe_diam, center=false,$fn=facettes);
    
translate([18+10+1,90,20])
rotate([0,90,0])
cylinder(h = 280,
    d=axe_diam, center=false,$fn=facettes);
translate([18+10+1,130,20])
rotate([0,90,0])
cylinder(h = 280,
    d=axe_diam, center=false,$fn=facettes);
}

translate([80+30,80+30,10])
rotate([0,0,0])
    import("charriot.stl");