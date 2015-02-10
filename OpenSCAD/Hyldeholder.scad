e=0.2;
baseThickness = 2;
h = 150;
w = 180;
crossW = 15;
cornerR=4;
shelveH=20;
shelveRailH=20;
holeD=4;
screwHeadD=8;
counterSunkH=3;

module triangle(x,y,h) {
	linear_extrude(height = h) polygon(points=[[0,0],[x,0],[0,y],[0,0]]);
}

module roundedTriangle(x,y,h,r) {
	translate([r,r,0]) minkowski() {
		triangle(x-r,y-r,h-1);
		cylinder(r=r,h=1);
	}
}

module side() {
	difference() {
		cube([w,h,baseThickness]);
		translate([crossW,crossW,0]) roundedTriangle(w-3.25*crossW,h-3.25*crossW,baseThickness+1,cornerR);
		translate([w-crossW,h-crossW,0]) rotate([0,0,180]) roundedTriangle(w-3.25*crossW,h-3.25*crossW,baseThickness+1,cornerR);
	}
}

module shelveRail() {
	difference() {
		union() {
			cube([w,baseThickness,shelveRailH+baseThickness]);
			cube([w,shelveH+2*baseThickness+2*e,baseThickness]);
			translate([0,shelveH+baseThickness+2*e,0]) cube([w,baseThickness,shelveRailH+baseThickness]);
			translate([0,shelveH+2*baseThickness+2*e,0]) cube([shelveH,baseThickness,shelveRailH+baseThickness]);
			translate([w-shelveH,shelveH+2*baseThickness+2*e,0]) cube([shelveH,baseThickness,shelveRailH+baseThickness]);
			translate([baseThickness,shelveH+3*baseThickness+2*e,baseThickness-e]) rotate([0,-90,0]) triangle(shelveH,shelveH,baseThickness);
			translate([w,shelveH+3*baseThickness+2*e,baseThickness-e]) rotate([0,-90,0]) triangle(shelveH,shelveH,baseThickness);
		}
		translate([shelveRailH/2,shelveH+baseThickness+2*e,shelveRailH/2+baseThickness]) rotate([-90,0,0]) hole();
		translate([w-shelveRailH/2,shelveH+baseThickness+2*e,shelveRailH/2+baseThickness]) rotate([-90,0,0]) hole();
   }
}

module top() {
	difference() {
		union() {
		cube([shelveH,2*baseThickness,shelveRailH+baseThickness]);
		translate([w-shelveH,0,0]) cube([shelveH,2*baseThickness,shelveRailH+baseThickness]);
		translate([0,0,baseThickness]) rotate([90,-90,90]) triangle(shelveH,shelveH,baseThickness);
		translate([w-baseThickness,0,baseThickness]) rotate([90,-90,90]) triangle(shelveH,shelveH,baseThickness);
	}
	translate([shelveRailH/2,0,shelveRailH/2+baseThickness]) rotate([-90,0,0]) hole();
	translate([w-shelveRailH/2,0,shelveRailH/2+baseThickness]) rotate([-90,0,0]) hole();
   }
}

module hole() {
	translate([0,0,-1]) cylinder(d=holeD+e,h=baseThickness+1);
	translate([0,0,2*baseThickness-counterSunkH]) cylinder(d1=holeD+e, d2 = screwHeadD+e, h=counterSunkH);
	translate([0,0,2*baseThickness]) cylinder(d = screwHeadD+e, h=1);
}

translate([0,shelveH+2*baseThickness,0]) side();
shelveRail();
translate([0,h+shelveH,0]) top();


