beam_width = 8;

module beam(number_of_holes, step=8) {
    beam_length = number_of_holes * 8;
        // Cut the holes
        for (x=[4 : step : beam_length]) {
            translate([x-4,0,2])
            cylinder(r=2.55, h=12, $fn=30);
        }
}

module side_connectors() {
	rotate(a=0)
    translate([-16,-beam_width*10,-2])
	beam(5);
	
	rotate(a=120)
     translate([-16,-beam_width*10,-2])
	beam(5);
	
	rotate(a=240)
     translate([-16,-beam_width*10,-2])
	beam(5);
}

// Uncomment 'projection' to create 2D (DXF-able) version
//projection(cut=true) {
    difference(){

        // Base plate
        //cube([8*9, beam_width * 9, 4]);
        cylinder(r=beam_width*12+1, h=4, $fn=6);
	
        // Delta-bot leg mounting holes
        //translate([36,36,-5]) 
        translate([0,0,-5])
        side_connectors();
		
        rotate(90)
        translate([0,0,-5])
	   center_connectors();

        rotate(0)
	    translate([0,-8*6,0])
        box();


//translate([0,-32,-5])
//rotate(90)
//beam(9);


    }
//}


module box() {
        // Bottom row
        translate([-beam_width * 5,-beam_width*5+4,0])
        for (x=[8 :  beam_width * 8 : beam_width * 9]) {
            translate([x, beam_width/2, -10])
            cylinder(r=2.55, h=20, $fn=30);
        }
	
        // Top row
        translate([-beam_width * 5,-beam_width*4-4,0])
        for (x=[8 : beam_width * 8 : beam_width * 9]) {
            translate([x, (beam_width/2) + beam_width * 8, -10])
            cylinder(r=2.55, h=20, $fn=30);
	   }
}

module center_connectors() {
    translate([8,16,0])
    rotate(a=0)
    beam(10,step=8*2);
	

    rotate(a=120)
    translate([8,16,0])
    beam(10,step=8*2);
	

    rotate(a=240)
    translate([8,16,0])
    beam(10,step=8*2);
}
