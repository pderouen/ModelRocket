include <Settings.scad>;

union(){
    // Create parachute chamber
    difference(){
        // outer body add 15mm for cone insert and threads
        cylinder(d=body_outside,h=chute_section_length + 15);
        // connector threads
        translate([0,0,-1]){nut(11);}
        // inner chamber
        translate([0,0,10]){cylinder(d=body_outside - 2, h=chute_section_length+10);}   
    }
    
    // add parachute connector
    intersection(){
        translate([-engine_interior_w/2-3,0,20]){cube([3,body_outside,3], center=true);}
        cylinder(d=body_outside,h=25);
    }
    
    // add guides
    translate([body_outside/2,0,15]){guide_ring();}
    translate([body_outside/2,0,55]){guide_ring();}
}
