include <Settings.scad>;

// Create the bolt
difference(){
    // bolt with head
    union(){
        cylinder(d=body_outside,h=2);
        translate([0,0,2]){bolt();}
    }
    // thrust hole
    cylinder(d=engine_interior_w,h=7);
}
