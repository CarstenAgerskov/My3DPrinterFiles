use <PhoneHolder.scad>;
use <CarAdapter.scad>;

translate([-81/2,0,0]) rotate([75,0,0]) holder();
translate([-35,25,38])  rotate([90,0,0]) MountPlate();
translate([2-29,-12,5]) cube([6,16,4],center=true);
translate([2+64-39,-12,5]) cube([6,16,4],center=true);

difference() {
  hull() {
    /*translate([0,1,4.5]) cube([60,36,4],center=true);*/
    translate([0,-12,4.5]) cube([60,16,3],center=true);
    translate([-33,18,4.5]) cube([54.5,2,4],center=true); 
  }
  #translate([0,-11,0]) cube([24,21,20],center=true);
}

