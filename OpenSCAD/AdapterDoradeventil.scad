include <Bolts/BOLTS.scad>
use <Fordaek.scad>

deckHoleR = 100/2;
deckTubeH=23; 

doradeInnerR = 87/2;
doradeHoleSpacing=100.5;
doradeHoleNumber=4;
doradeHoleR=4/2;
doradeRotation=45; /*+15*/
mountHoleSpacing1=128;
mountHoleNumber1=2;
mountHoleR1=6/2;

mountHoleSpacing2=128;
mountHoleNumber2=6;
mountHoleR2=4.7/2;


shieldR=200/2;
shieldHoleSpacing=192; /* changed from 191 to 192 after 1 print */
shieldHoleNumber=4;
shieldHoleR=4/2;
shieldRotation=45; /*+0*/

baseZ=11;

e=0.2;
$fn=80;

module centerCutOut() {
  translate([0,0,-1]) cylinder(r=doradeInnerR+e,h=100);
  translate([0,0,deckTubeH-7]) cylinder(r=deckHoleR-e-2,h=100);
}

module tube() {
  difference() {
    cylinder(r=deckHoleR-e,h=deckTubeH); 
    centerCutOut();
    hexHoles(doradeHoleNumber,doradeHoleSpacing,"M4",-baseZ-1,doradeRotation);
  }
}

module templateRing() {
      /*test template*/
      difference() {
        cylinder(r=100,h=baseZ);
        translate([0,0,-1]) cylinder(r=90,h=100);
      }
}

module plate() {
  difference() {
    union() {
      difference() {
        cylinder(r=shieldR,h=baseZ);
        /* test template */
        /*rotate([0,0,45]) {
            translate([6,6,-1]) cube([100,100,50]);
            mirror([1,0,0]) translate([6,6,-1]) cube([100,100,50]);
            mirror([0,1,0]) translate([6,6,-1]) cube([100,100,50]);
            mirror([1,1,0]) translate([6,6,-1]) cube([100,100,50]);
        }*/
      }
		holes(shieldHoleNumber,shieldHoleSpacing,6,shieldRotation);
      /* test Template */
      /*templateRing();*/
      /*cylinder(r=70,h=2);
      holes(mountHoleNumber1,mountHoleSpacing1,mountHoleR1+2,90);
      holes(mountHoleNumber2,mountHoleSpacing2,mountHoleR2+2,30);*/
    }
    translate([-100,-100,-10]) cube([200,200,10]);
    centerCutOut();
/*    holes(mountHoleNumber1,mountHoleSpacing1,mountHoleR1,90);*/
    holes(mountHoleNumber2,mountHoleSpacing2,mountHoleR2,30);
    hexHoles(doradeHoleNumber,doradeHoleSpacing,"M4",-12,doradeRotation);
    holes(doradeHoleNumber,doradeHoleSpacing,2+2*e,doradeRotation);
    hexHoles(shieldHoleNumber,shieldHoleSpacing,"M4",-12,shieldRotation); 
    holes(shieldHoleNumber,shieldHoleSpacing,2+2*e,shieldRotation);
    #translate([0,0,baseZ]) rotate([180,0,0]) daek();
   
  }
}

module hexHoles(nofHoles,holeSpacing,size,height,v) {
  for( hole = [1 : nofHoles] ) {
    rotate([180,0,hole*(360/nofHoles)+v]) translate([holeSpacing/2,0,height]) threadCutH(size,5);
  }
}

module holes(nofHoles,holeSpacing,holeR,v) {
  for( hole = [1 : nofHoles] ) {
    rotate([0,0,hole*(360/nofHoles)+v]) translate([holeSpacing/2,0,-1]) cylinder(r=holeR+e,h=30);
  }
}

module threadCut(mType) {
    err=0.3;
    translate([0,0,3]) {
      translate([err,err,0]) ISO4014(mType);
      translate([-err,-err,0]) ISO4014(mType);
      translate([-err,err,0]) ISO4014(mType);
      translate([err,-err,0]) ISO4014(mType);
      translate([err,0,0]) ISO4014(mType);
      translate([-err,0,0]) ISO4014(mType);
      translate([0,err,0]) ISO4014(mType);
      translate([0,-err,0]) ISO4014(mType);  
    }
}

module threadCutH(mType,h) {
	threadCut(mType);
   for ( i=[0:2:h] ) {
     translate([0,0,i]) threadCut(mType);
   }
   translate([0,0,h]) threadCut(mType);
}


tube();
plate();


/*
difference() {
  cylinder(r=55,h=1);
  cylinder(r=45,h=1);
  hexHoles(doradeHoleNumber,doradeHoleSpacing,"M4",-12,doradeRotation);
}

difference() {
  cylinder(r=100,h=1);
  cylinder(r=90,h=1);
  hexHoles(shieldHoleNumber,shieldHoleSpacing,"M4",-12,shieldRotation); 
}
*/