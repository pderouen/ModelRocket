include <Settings.scad>;

difference(){
    cylinder(d=body_outside, h=1);
    cylinder(d=body_outside - 2, h=1);
}