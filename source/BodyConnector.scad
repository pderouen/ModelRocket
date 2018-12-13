include <Settings.scad>;

// body connector
difference(){
    bolt(20);
    cylinder(h=20, d=engine_interior_w);
}