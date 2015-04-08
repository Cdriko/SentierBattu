/*
Smoothieboard attach for electrical enclosure
*/



module smoothieholes(){
translate([0,0,-4])
union(){//holes
		
			translate([3.5,3,-30])
			cylinder(r=1.6,h=60);
			
			translate([3.5,102,-30])
			cylinder(r=1.6,h=60);
			
			translate([(105-8.77),9,-30])
			cylinder(r=1.6,h=60);
			translate([(105-3.5),102,-30])
			cylinder(r=1.6,h=60);
		
		}


}



module SmoothiePlate(){
	//-------------------smoothieBoard
	difference(){
translate([0,0,-0.75])
		cube([105,130,1.5]);
		translate([0,0,-1])
		smoothieholes();
	}
//USB port
translate([77,0,-0.75])
		cube([12.3,16.6,10.8]);
}

//background rail
module backSupport(){
	//back support
translate([0,0,-0.5])
linear_extrude(height = 1,center=true){
union(){
	hull() {
	   translate([3.5,3,0])
				circle(12);
	   translate([(105-8.77),9,0]) circle(4);
	}
	hull() {
	translate([(105-3.5),102,0])circle(4);
	 translate([3.5,122,0])
				circle(10);
	translate([3.5,127,0])
				circle(4);
	 }
	difference(){
		hull() {
		translate([(3.5),102,0])circle(17.2);
		 translate([(3.5),9,0]) circle(15);
		 }
		hull() {
		translate([(18.7),105,0])circle(5);
		 translate([(18.7),19.6,0]) circle(5);
		 }
	}
}
}

union(){//holes
		
			translate([3.5,3,0])
			cylinder(r=3,h=1);
			
			translate([3.5,102,0])
			cylinder(r=3,h=1);
			
			translate([(105-8.77),9,0])
			cylinder(r=3,h=1);
			translate([(105-3.5),102,0])
			cylinder(r=3,h=1);
		
		}



}



module arch(){//for the wall fixation

	difference(){
	
		//Arch
		rotate([90,0,0])
		linear_extrude(height = 15,center=true)
		hull() {
				translate([22,0,0])circle(25);
				 translate([7,40,0]) circle(10);
				 }
		union(){//wall holes

rotate([0,-90,0]){
			translate([10,2,-40])
			cylinder(r=2.5,h=60);
			translate([40,2,-40])
			cylinder(r=2.5,h=60);
}

		}
		
	
	}
}


difference(){





	union(){

difference(){
translate([-7,0,0])
union(){
		//archs
		translate([0,3,0])
		arch();




		translate([0,126,0])
mirror([0,1,0])
		arch();
}

union(){
translate([0,-0.2,0])
cube([105,130.4,500]);

}
}
		
		
		//total backplate
		difference(){
		scale([1,1,2])
		backSupport();
		
		}
	}

	union(){//bounding box
	
		translate([-10,133,-20])
		cube([105,130,300]);
		translate([-10,-33,-20])
		cube([105,30,300]);
		
		translate([-3,137.5,-20])
		rotate([0,0,180])
		cube([105,160,300]);
		
		translate([-20,-25,-32])
		cube([305,300,30]);
smoothieholes();
	
	}

}
///smoothie preview
//color([0.9,0.4,0.2,0.5])
//SmoothiePlate();
