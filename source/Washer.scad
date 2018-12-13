include <Settings.scad>;

difference(){
    cylinder(d=body_outside, h=1);
    cylinder(d=engine_w, h=1);
}