module p() {
 cube([.0001,.0001,.0001],center=true);
}

module daek() {
hull() {

translate([100,100,0]) p();
translate([80,100,1.5]) p();
translate([60,100,2.45]) p();
translate([40,100,3.15]) p();
translate([20,100,3.8]) p();
translate([0,100,3.85]) p();
translate([-20,100,3.8]) p();
translate([-40,100,3.15]) p();
translate([-60,100,2.45]) p();
translate([-80,100,1.5]) p();
translate([-100,100,0]) p();

translate([100,-100,0]) p();
translate([80,-100,1.55]) p();
translate([60,-100,2.75]) p();
translate([40,-100,3.35]) p();
translate([20,-100,4.3]) p();
translate([0,-100,4.5]) p();
translate([-20,-100,4.3]) p();
translate([-40,-100,3.35]) p();
translate([-60,-100,2.75]) p();
translate([-80,-100,1.55]) p();
translate([-100,-100,0]) p();

translate([0,0,-50]) cube([200,200,1],center=true);
}
}


difference() {
union() {
difference() {
cylinder(r=100,h=3,center=true);
cylinder(r=90,h=12,center=true);
}
translate([0,-90,0]) cylinder(r=5,h=3,center=true);
}
#daek();
}
