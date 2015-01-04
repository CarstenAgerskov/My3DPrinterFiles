nutOuterR = 7.5;
cameraHolderKnobR=14;
cameraHolderKnobH=8;
spindelR=3.5;
railHolderLength = 2*cameraHolderKnobR-6;
railHolderWidth = 28;

$fn=60;

module railHolder(length,width) {
	difference() {
     minkowski() {
		 translate([0,0,8/2]) cube([length,width-4,6],center=true);
       rotate([0,90,0]) cylinder(r=2,h=0.001);
     }
	  #translate([0,0,2+4/2]) cube([length+20,19,4.2],center=true);
	  #translate([0,0,0]) cube([length+20,14,4],center=true);
	}
}

module cameraHolder() {
  difference() {
    minkowski() {
	   cube([2*cameraHolderKnobR-6,2*cameraHolderKnobR+2,cameraHolderKnobH+2],center=true);
      rotate([0,90,0]) cylinder(r=2,h=0.001);
    }
    minkowski() {
      #cube([2*cameraHolderKnobR,2*cameraHolderKnobR-2,cameraHolderKnobH-2],center=true);
      rotate([0,90,0]) cylinder(r=2,h=0.001);
    }
    #translate([0,0,cameraHolderKnobH]) cylinder(r=spindelR,h=20,center=true);
  }  
}

rotate([0,90,0]) difference() {
  union() {
    railHolder(railHolderLength,railHolderWidth);
    translate([0,0,9+(cameraHolderKnobH+6)/2]) cameraHolder();
  }
  #translate([0,0,0]) cylinder(r=nutOuterR,h=25,center=true);
}

/*cube([10,2*cameraHolderKnobR,100],center=true);*/
/*translate([0,0,1]) cube([10,2*cameraHolderKnobR,2],center=true);*/



