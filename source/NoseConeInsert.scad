include <Settings.scad>;

difference(){
    // insert
    cylinder(d=body_outside - 2 - nose_cone_insert_tolerance,h=nose_cone_insert_length);
    
    // cut out tie off for parachute
    intersection(){
        cylinder(d=engine_w-nose_cone_insert_tolerance-2, h=10);
        union(){
            translate([-4, 3, 0]){cube([8, 8, 9]);}
            translate([-4, -11, 0]){cube([8, 8, 9]);}
            translate([-4, -4, 2]){cube([8, 8, 7]);}
        }
    }
}

// screw threads for nose cone
translate([0,0,nose_cone_insert_length]){isoThread(d=10, h=5, pitch=2, internal = false, angle = 60);}