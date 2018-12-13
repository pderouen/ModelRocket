include <Settings.scad>;

union(){
    // Create parachute chamber
    difference(){
        // outer body add 15mm for cone insert and threads
        cylinder(d=body_outside,h=chute_section_length + 15);
        // connector threads
        translate([0,0,-1]){nut(11);}
        // inner chamber
        translate([0,0,10]){cylinder(d=engine_w, h=chute_section_length+10);}   
    }
    
    // add parachute connector
    intersection(){
        translate([-engine_interior_w/2-1,0,13]){cube([1,body_outside,1], center=true);}
        cylinder(d=body_outside,h=14);
    }
    
    // add guides
    translate([body_outside/2,0,15]){guide_ring();}
    translate([body_outside/2,0,55]){guide_ring();}
}
