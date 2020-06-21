// PRUSA iteration3
// PSU Cover
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// NV: Modified for the 3Pin IEC320 C14 Inlet Module Plug
  
module CubeAdjust(Xdim, Zdim){
    for (x =[6:12.2:Xdim-12]){
        for (z =[4.5:12:Zdim-12]){
        
        translate([x,-0.2,z])cube([10.3,0.4,10]);
        }
        }
}

/**
 * NV: Modified for the 3Pin IEC320 C14 Inlet Module Plug
 */
module socket_cutout() {
  cube_width=42.5;
  cube_height=29;
  translate([50,5,50]) {
    cube([cube_width,cube_height,10]);
    translate([-25,0,0]) translate([cube_width/2, cube_height/2,-5]) {
      cylinder(r=1.6, h=20, $fn=50);
      rotate([0,0,90]) translate([0,0,-3])  cylinder( h = 10, r = 3.5, $fn=6); // NV: nut trap      
    }
    translate([+25,0,0]) translate([cube_width/2, cube_height/2,-5]) {
      cylinder(r=1.6, h=20, $fn=50);
      rotate([0,0,90]) translate([0,0,-3])  cylinder( h = 10, r = 3.5, $fn=6); // NV: nut trap
    }
  }
  
}



module PSU_COVER()
{
difference(){
union(){
   
translate([0,0,-0.46])cube([116,50+15+5,54.25]); // Base

translate([23.5,0,-3.5])cube([14-0.5,50+15+5,5]); // Back pillar 1

translate([66-0.5+8,0,-3.5])cube([14,50+15+5,5]); // Back pillar 2

translate([91+4,0,-0.46])cube([6,50+15,54.25]); // Base for bracket

translate([-2,45.4-4,19])cube([2,2.6,15]); // nipple on the right

translate([-1.6,0,-0.5])cube([1.65,70,2.5]); // Frame skirt 1
translate([-1.6,0,0])cube([1.65,29,53.78]); // Frame skirt 2
translate([-1.6,0,51.32])cube([1.65,70,2.46]); // Frame skirt 3
  

}

translate([-5,2,2])cube([10,50+15,49.3]); // remove right for screws
//pretty corners
translate([-11,-2,-3.6])rotate([0,0,-45])cube([10,10,59]); // right bottom
translate([95+21-5,-2,-2])rotate([0,0,-45])cube([10,10,58]); // left botton
translate([-3,-9,-4.46])rotate([-45,0,0])cube([130,10,10]); // back bottom

translate([-3,-12,54.9])rotate([-45,0,0])cube([130,10,10]); // bottom front edge
translate([-3,45+15+5,-4.46])rotate([-45,0,0])cube([130,10,10]); // bottom edge
translate([-3,48+15+5,54.78])rotate([-45,0,0])cube([130,10,10]); // top front edge

translate([113-3,70+5,-2])rotate([0,0,-45])cube([10,10,58]); // top left edge

translate([111,0-10,-20])rotate([0,-45,-45])cube([20,20,20]); // back left bottom corner
translate([111,0-10,45])rotate([0,-45,-45])cube([20,20,20]); // front left bottom corner
translate([111,60,-10])rotate([-35,-45,-45])cube([20,20,20]); // back left top corner
translate([111,60,64])rotate([-55,48,-48])cube([20,20,20]); // front left top corner

translate([79+13.5,-5,67.28])rotate([0,45,0])cube([20,90,20]); // front left line
translate([79+13.5,-5,-13.96])rotate([0,45,0])cube([20,90,20]); // back left line
translate([-7,-5,67.28])rotate([0,45,0])cube([20,90,20]); // froNt right line

translate([3,2,2])cube([106.02,50.02+15+5,50.02-0.7]); // main cutout
translate([-3,50-16.4+15,2])cube([100,16.5+5,50-0.7]); // insert cutout
translate([-3,50-16.4-15.6+15,2])cube([10,100,17]); // right bottom cutout

translate([101+2,50-16.4-17.6+15+0.9-2.5,2])cube([10,100,50-0.7]); // shelf top cutout
translate([101+2,10,2])rotate([0,0,45]) cube([10*sqrt(2),10*sqrt(2),50-0.7]); // shelf angle cutout
translate([101+2,2,2]) cube([10,18,50-0.7]); // shelf bottom cutout

//translate([-3,50-16.4-17.6+15+0.9-2.5,2])cube([100,100,10]); //  bottom cutout

translate([20,60.5,50])cube([73,10,10]); // Vent cutout
//translate([20,67.5,50])rotate([45,0,0])cube([10,10,10]);
//translate([93,67,50])rotate([45,0,0])cube([10,10,10]); // NV: not needed


translate([7-0.5-0.5+18+6,43.5-1+15+0.5+4.5,-10])cylinder(r=2,h=50,$fn=15); //  right back mounthole cutout
translate([7-0.5-0.5+18+6,43.5-1+15+0.+4.5,-3.7])cylinder(r2=2, r1=3.7,h=2,$fn=15);

translate([67.5-0.7-0.5+8+6,43.5-1+15+0.5+4.5,-10])cylinder(r=2,h=50,$fn=15); //  left back mounthole cutout
translate([67.5-0.7-0.5+8+6,43.5-1+15+0.5+4.5,-3.7])cylinder(r2=2, r1=3.7,h=3,$fn=15);

translate([0,0,0.7]) { // NV: made holes more compliant
  translate([130+16,32+26+4.5,55-4-25+11.5])rotate([0,-90,0])cylinder(r=2,h=50,$fn=35); // Left side bracket screw hole L
  translate([117,32+26+4.5,55-4-25+11.5])rotate([0,-90,0])cylinder(r2=2, r1=4.1,h=3,$fn=15);
}
translate([0,0,-0.7]) { // NV: made holes more compliant
  translate([130+16,32+26+4.5,55-4-25+11.5])rotate([0,-90,0])cylinder(r=2,h=50,$fn=35); // Left side bracket screw hole L
  translate([117,32+26+4.5,55-4-25+11.5])rotate([0,-90,0])cylinder(r2=2, r1=4.1,h=3,$fn=15);
}

/*
translate([0,0,0.7]) { // NV: made holes more compliant
  translate([130+16,32+26+4.5,55-4-25-11.5])rotate([0,-90,0])cylinder(r=2,h=50,$fn=35); // Left side bracket screw hole R
  translate([117,32+26+4.5,55-4-25-11.5])rotate([0,-90,0])cylinder(r2=2, r1=4.1,h=3,$fn=15);  
}
translate([0,0,-0.7]) { // NV: made holes more compliant
  translate([130+16,32+26+4.5,55-4-25-11.5])rotate([0,-90,0])cylinder(r=2,h=50,$fn=35); // Left side bracket screw hole R
  translate([117,32+26+4.5,55-4-25-11.5])rotate([0,-90,0])cylinder(r2=2, r1=4.1,h=3,$fn=15);  
}
*/

//translate([-2,0,-1])CubeAdjust(116,54.25); // bottom squares cutout

for(i=[0:9]){
translate([10+i,6.5,-10])cylinder(r=3.5,h=50); //  left back power wire cutout
}

}

difference() {
  union() {
    translate([42,0,49])cube([8-0.5,20+5,3]); // NV: switch piller1  
    translate([42.5+50,0,49])cube([8-0.5,20+5,3]); // NV: switch piller2  
  }
  translate([41,12,35]) rotate([45,0,0]) cube([60,15,20]);    
}

}

module PSU_Y_REINFORCEMENT()
{
difference()
{
    union()     // base shape
        {
            translate([ 59.5, 0, -18 ]) cube([ 33, 6, 19 ]);  // reinforcement plate
            translate([ 73.5, 5, -18 ]) cube([ 5, 16, 19 ]);  // vertical_reinforcement    
        }
    union ()    // cutouts
        {
            
            
            // corner cuts
            translate([ 87.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            translate([ 52.5, -8, -20 ]) rotate([ 0, 45, 0 ]) cube([ 10, 20, 10 ]);  //corner cut
            
            // angled vertical support
            translate([ 68.5, 20, -34 ]) rotate([ 45, 0, 0 ]) cube([ 15, 23, 20 ]);  //vertical reinf cutout
            
            // bottom surface cuts
            translate([ 66.2, -0.2, -5])cube([23.6, 0.4, 5.6]);
            translate([ 68 + 1.8 +2.6, -0.2, -7.7 -5.6])cube([11.2, 0.4, 5.6]);
            
            
            translate([ 88, 8, -11.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole A
            translate([ 68, 8, -11.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole B
            
            translate([ 88, 8, -9.5 ]) rotate([ 90, 0, 0]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole A
            translate([ 68, 8, -9.5 ]) rotate([ 90, 0, 0 ]) cylinder( h = 10, r = 1.8, $fn=30 );  //hole B
            
            translate([ 86.2, -10, -11.5 ]) cube([ 3.6, 20, 2 ]);  // hole cut extension
            translate([ 66.2, -10, -11.5 ]) cube([ 3.6, 20, 2 ]);  // hole cut extension
            
        }
}
  
}


module FINAL_PART(){
  difference() {
    
    union()
        {
            PSU_COVER();
            PSU_Y_REINFORCEMENT();
        }   
    socket_cutout();
        // logo
      rotate([-90,0,0]) 
        translate([19,-53,40]) 
          rotate([90,0,0])      // This took time please don't remove logo.
          linear_extrude(2) text("Noami3", size=16);
      }
    rotate([-90,0,0]) translate([63,-53.7,5]) custom_support(height=29, length=20);
        
}


module custom_support(height=10, length=42) {

    w = 6;
    n = length/w;
  
  module col() {    
    difference() {
      cube([w/2,w/2,height]);
      translate([0.4,-0.8,-0.1]) cube([w/2-.8,w/2,height + 0.2]);
    }      
  }

  for(i=[0:n]) {
    translate([i*w,-0.4,0]) col();
    translate([w*i,w/2-0.4,0]) rotate([0,0,180]) col();
  }
  
}


rotate([90,0,0]) {
  FINAL_PART();
}




