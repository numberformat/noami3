// PRUSA iteration3
// lcd-support-B
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// NV: Support for the standard reprap discount smart controller.
//     - added clearance for the variable pot that appears on the back of the display

use<lcd-support-A.scad>;

//%translate([-80.5,-2.3,0]) import("../../stl/LCD-holder-B.stl");

//SD card cover
module lcd_support_B() {
  rotate([0,0,45]) difference(){
  translate( [ -3 , 3 , 10 ] )  cube( [ 2 , 55 , 10 ] ); 
  translate( [ -4 , 3 , 20 ] ) rotate([0,90,0]) cylinder( h = 4, r = 7, $fn=30); 
  translate( [ -4 , 58 , 20 ] ) rotate([0,90,0]) cylinder( h = 4, r = 7, $fn=30); 
 } 
}

module cut() {
    translate([-25,41,8]) rotate([90,0,-45]) {
    translate([0,-4.5,12.5]) cube([9,9,30], center=true);
    cylinder(h=25,r=4.5, $fn=30);
  }      

}
difference() {
  union() {
    lcd_support_A();
    lcd_support_B();
  }
  cut();
}