baseThickness = 2;
phoneInCaseWidth=77;
phoneInCaseHeight=20;
openingWidth=68;
$fn=40;

module phoneMockup() {
  import("C:/Users/Carsten/Documents/3D print/My3DPrinterFiles/stl/Samsung_GSIII.STL");
}

module phoneInCaseMockup() {
  resize([phoneInCaseWidth,0,phoneInCaseHeight], auto=true) phoneMockup();
}

module holderShell(wallThickness) {
   b=2*wallThickness;
	hull() {
		phoneInCaseMockup();
		translate([b,b,0]) phoneInCaseMockup();
		translate([0,b,0]) phoneInCaseMockup();
		translate([b,0,0])phoneInCaseMockup();
		translate([0,0,b])phoneInCaseMockup();
		translate([b,b,b]) phoneInCaseMockup();
		translate([0,b,b]) phoneInCaseMockup();
		translate([b,0,b])phoneInCaseMockup();

   }
   /*translate([phoneInCaseWidth/2+baseThickness-65/2,0,0]) cube([65,114,15]);*/
}

module opening() {
  hull() {
    resize([openingWidth,0,0], auto=true) phoneMockup();
    translate([0,0,17]) resize([openingWidth,0,0], auto=true) phoneMockup();
  }
}

module holder() {
  difference() {
    holderShell(baseThickness);
    hull() {
      translate([baseThickness,baseThickness,baseThickness]) phoneInCaseMockup();
      translate([baseThickness+4.5,baseThickness+4.5,baseThickness+6.5]) resize([openingWidth,0,0], auto=true) phoneMockup(); 
    }
    translate([baseThickness+4.5,baseThickness+4.5,4]) opening();
    translate([phoneInCaseWidth/2+baseThickness-24/2,-1,baseThickness+0.5])cube([24,20,20]);
    translate([-20,80,-20]) cube(200,200,200);
/*    translate([phoneInCaseWidth/2+baseThickness,60,1]) holes();*/
  }
}

module holes() {
   holeWidth=49.5;
   /*offset 2.6 mm fra top */
	translate([holeWidth/2,-0,0]) cylinder(h=9,r=2,center=true); 
	translate([-holeWidth/2,-0,0]) cylinder(h=9,r=2,center=true); 
	translate([holeWidth/2,0,3.5/2]) cylinder(h=3.5,r1=2,r2=4,center=true);
	translate([-holeWidth/2,0,3.5/2]) cylinder(h=3.5,r1=2,r2=4,center=true);
}





difference() {
rotate([90,0,0]) holder();
#translate([0,-50,-1]) cube([100,100,70]);
}


