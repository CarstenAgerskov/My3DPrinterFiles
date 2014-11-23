innerR = 30/2;
outerR = innerR + 2;
baseThickness = 3;
lowerTorusCircularR = 3;
totalHeight = 8;
faces = 50;



difference() {
	union()
	{ 
		rotate_extrude(convexity = 10, $fn = faces)
			translate([outerR, lowerTorusCircularR, 0])
			circle(r = lowerTorusCircularR, $fn = faces);
		cylinder(h = totalHeight, r=outerR, $fn = faces);
		translate ([0,0,(totalHeight-(outerR-innerR)/2)]) 
	      rotate_extrude(convexity = 10, $fn = faces)
			translate([((outerR+innerR)/2), ((outerR-innerR)/2), 0])
			circle(r = ((outerR-innerR)/2), $fn = faces);
	}
		translate([0,0,baseThickness]) 
			cylinder(h = (totalHeight-baseThickness + 1), r=innerR, $fn = faces);
}

