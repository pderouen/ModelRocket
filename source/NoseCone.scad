include <Settings.scad>;

difference(){
    union(){
        // cone
        cylinder(h=80, d1=body_outside, d2=5);
        // rounded top
        translate([0,0,79.7]){sphere(d=5);}
    }

    // threads for cone insert
    isoThread(d=10+nut_tolerance, h=6, pitch=2, internal=true, angle = 60);
}