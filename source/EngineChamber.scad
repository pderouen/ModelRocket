include <Settings.scad>;

union(){
    // Create the engine chamber
    difference(){
        cylinder(d=body_outside,h=engine_l + 15);
        translate([0,0,-1]){nut();}
        translate([0,0,5 + engine_tapper_l]){
            cylinder(d=engine_w, h=engine_l - engine_tapper_l);
        }
        hull(){
            translate([0,0,5 + engine_tapper_l]){
                cylinder(d=engine_w, h=0.1);
            }
            translate([0,0,5]){
                cylinder(d=body_outside - 2, h=0.1);
            }
        }
        translate([0,0,5+engine_l]){nut(10);}
    }

    // fins
    fin();
    rotate(a=90, v=[0,0,1]){fin();}
    rotate(a=-90, v=[0,0,1]){fin();}
    rotate(a=180, v=[0,0,1]){fin();}
    
}