
h=24;
l=64;
b=47.5;
r=50;
holderThickness=2;
baseThickness=3;
backPowerWidth=30.2;
baseBackSquareLength=24;
powerCableWidth=6;
powerCableHeight=3.5;
backPlateZ=70;
backPlateY=backPowerWidth+2*baseThickness;
backPlateX=20;
brushHolderR=2;
brushHolderH=14;

faces=40;
$fn=faces;


module holderSphere() {
  difference() {
    union() {
      difference() {
        union() {
          resize([l+holderThickness,b+holderThickness,r*2+holderThickness]) sphere(r = 100, $fn=faces);
          translate([l/2,backPowerWidth/2+baseThickness/2,h/2]) cube([baseBackSquareLength,baseThickness,h], center=true);
          translate([l/2,-backPowerWidth/2-baseThickness/2,h/2]) cube([baseBackSquareLength,baseThickness,h], center=true);
        }
        resize([l,b,r*2])  sphere(r = 100, $fn=faces);
        translate([0,0,-50]) cube([100,100,100], center=true);
        translate([0,0,50+h]) cube([100,100,100], center=true);
        translate([-52,0,50+baseThickness]) cube([100,100,100],center=true);
      }
      resize([l,b,baseThickness]) rotate_extrude(convexity = 10) translate([10,0,0]) polygon( points=[[1,0],[0,0],[1,1]] );
    }
	 translate([100/2,0,h/2]) cube([100,backPowerWidth,h+2],center=true);
  }
}

module basePlate() {
  difference() {
    union() {
      resize([l+holderThickness,b+holderThickness,baseThickness]) cylinder(r = 100);
      translate([l/2,0,baseThickness/2]) cube([baseBackSquareLength,backPowerWidth+2*baseThickness,baseThickness], center=true);
    }
    translate([0,0,-1]) scale([0.6,0.6,2]) resize([l,b,baseThickness]) cylinder(r = 100);
    translate([l/2,0,baseThickness/2]) cube([baseBackSquareLength+5,powerCableWidth,100], center=true);
  }

  translate([l/2+13/2,0,10+baseThickness/2+baseThickness]) cube([baseBackSquareLength-13,backPowerWidth,baseThickness],center=true);

  difference() {
    translate([l/2+7/2,0,h+baseThickness/2+baseThickness*2]) cube([14,backPowerWidth+2*baseThickness,baseThickness],center=true);
    #translate([l/2+7/2,0,h+baseThickness/2+baseThickness]) rotate([0,0,180]) brushHolderPlate();
  }
}


module backPlate() {
  difference() {
    union() {
      translate([0,0,-backPlateY/4]) cube([baseThickness,backPlateY,backPlateZ-backPlateY/2],center=true);
      translate([0,0,backPlateZ/2-backPlateY/2]) rotate([0,90,0]) cylinder(r=backPlateY/2,h=baseThickness,center=true); 
	 } 
    translate([0,0,-2]) backPlateHoles();
  }
}

module backPlateHoles() {
  translate([-baseThickness/2-1,0,-26]) rotate([0,90,0]) backPlateHole();
  translate([-baseThickness/2-1,0,26]) rotate([90,0,90]) backPlateHole();
}

module backPlateHole() {
  hull() {
    translate([-4+1.7,0,0]) cylinder(r=1.7, h=baseThickness+2);
    translate([4-1.7,0,0]) cylinder(r=1.7, h=baseThickness+2);
  }
}

module brushHolder() {
  cylinder(r=brushHolderR, h=brushHolderH, center=true);
  translate([6/2,0,-brushHolderH/2+baseThickness/2]) cube([6,2*brushHolderR,baseThickness],center=true);
}

module brushHolderPlate() {
	cube([14,backPowerWidth+2*baseThickness,baseThickness],center=true);
   translate([1,10,brushHolderH/2+baseThickness/2]) brushHolder();
   translate([1,-10,brushHolderH/2+baseThickness/2]) brushHolder();
}


translate([0,0,l/2+baseBackSquareLength/2+baseThickness/2]) rotate([0,90,0]) union() {
    translate([0,0,baseThickness]) holderSphere();
    basePlate();
    translate([l/2+baseBackSquareLength/2,0,backPlateZ/2]) backPlate();
}

translate([-10,0,baseThickness/2]) brushHolderPlate();


