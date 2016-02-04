$passage = 7;
$diam=11;
$trouvis = 5.2;
$hauteurint  = 3;
$hauteurvis = 2;
$fn=250;

difference()
{
    union()
    {
        cylinder(h=$hauteurint,d=$diam);
        cylinder(h=$hauteurint+$hauteurvis,d=$passage);
    }
    translate([0,0,-0.1])
        cylinder(h=$hauteurint+$hauteurvis+0.2,d=$trouvis);
    translate([$passage/2,-$diam/2,-0.1])
        cube([5,$diam,$hauteurint+$hauteurvis]);
}