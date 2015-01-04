handlebarR=33/2;
baseThickness=2;
sideThickness=4;
holderL=175;
holderSideWidth=30;
holderSideHeight=50;
holderWidth=112;
tabletH=22;
tabletW=260;
tabletL=180; 

module tablet() {
  cube([tabletL,tabletW,tabletH],center=true);
}

module holderSide() {
  difference() {
  minkowski() {
    difference() {
      union() {
        cylinder(r=handlebarR+baseThickness,h=holderSideWidth);
        translate([holderL/2-(handlebarR+baseThickness+10),0,0]) 
          minkowski() {
            translate([0,-2,0]) cube([holderL-40,holderSideHeight-40,sideThickness],center=true);
            cylinder(r=20,h=0.0001);
          }
      }
      #translate([90,30,0]) cube([60,50,50],center=true);
      #cylinder(r=handlebarR,h=100,center=true);
    }
  }
    cylinder(r=2,h=0.001);  
}
}

module mirrorObject() {
  	translate([0,0,holderWidth/2+holderSideWidth/2]) holderSide();
}



rotate([90,0,0]) difference() {
  rotate([90,0,0]) {
/*    mirrorObject();*/
    mirror([0,0,1]) mirrorObject();
  }
  #translate([130-tabletL/2,0,22]) rotate([0,15,0]) tablet();
}
