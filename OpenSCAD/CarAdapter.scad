module InCarPlate() {
  cube([50,70,5.5],center=true);
}

module InCarPlateCutOut() {
  cube([50.5,71,5.8],center=true);
}

module InCarPlateBackCouOut() {
  cube([47,68,6],center=true);
  
}

module MountPlateBase() {
  minkowski() {
    InCarPlateCutOut();
    cube([4,2,4]);
  }
}

module MountPlate() {
  difference() {
    MountPlateBase();
    translate([2,0,2]) InCarPlateCutOut();
    translate([2,-1.5,-2]) InCarPlateBackCouOut();  
  }
}


rotate([90,0,0]) MountPlate();
