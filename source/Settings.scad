// Thread library came from:
// https://www.thingiverse.com/thing:2277141/files
use <ThreadLibrary\quickthread.scad>;
$fn=80;
nut_tolerance = 0.8;

engine_tolerance = 2;
engine_w = 18 + engine_tolerance;
engine_l = 70 + engine_tolerance;
engine_interior_w = 12;

chute_section_length = 140;

nose_cone_insert_length = 15;
nose_cone_insert_tolerance = 0.6;

body_outside = engine_w + nut_tolerance + 8;
bolt_width = body_outside - nut_tolerance - 2;

// to get 45 degree tapper for easy printint
engine_tapper_l = (body_outside - engine_w) / 2;

module nut(height=6){isoThread(d=bolt_width+nut_tolerance, h=height, pitch=2, internal=true, angle = 60);}

module bolt(height=5){isoThread(d=bolt_width, h=height, pitch=2, internal = false, angle = 60);}

module guide_ring(){
  difference(){
      //ring
      scale([2,1,1]){
          difference(){
              cylinder(d=7,h=7);
              cylinder(d=5,h=7);
          }
      }
      // 45 degree angle for printing
      translate([8.5,0,0]){rotate(a=45, v=[0,1,0]){cube(12, center=true);}}
      // slice off the shape of the rocket body
      translate([-body_outside/2,0,0]){cylinder(d=body_outside, h=7);}
  }
}

module fin(h=60, l=30, w=0.8){
    FinPoints = [
        [0, 0, 0],    //0
        [w, 0, 0],    //1
        [0, 0, h],    //2
        [0, l, 0],    //3
        [w, l, 0],    //4
        [0, l, h],    //5
        [w, 0, h],    //6
    ];
    FinFaces = [
        [1, 6, 4],     // left triangle
        [0, 3, 2],     // right triangle
        [0, 1, 4, 3],  // rectangle base
        [3, 4, 6, 2],  // rectangle hypotenuse
        [0, 2, 6, 1]   // rectangle adjacent
    ];
    union(){
        translate([-w/2,body_outside/2-0.5,0]){polyhedron(FinPoints, FinFaces);}
        translate([-10.5, body_outside/2 + 10, 0]){
            // tab with perforations
            difference(){
                // tab
                cube([20 + w,l,0.2]);
                // perforations
                for (i=[1:2:body_outside/2+8]){
                    translate([(20+w)/2-w,i,0]){cube([w*2,1,0.2]);}
                }
            }
        }
    }
}