// noami3 left Z Limit switch holder

use <../../OpenSCAD_electronics/switches/micro_switch_10T85.scad>
use <../z-axis-bottom.scad>

length=52;
depth=50;
height=31;
baseHeight=20;

module mk3_zlimit_switch_holder() {
    difference() {
        cube([length,depth,height]);
        translate([21,-8,-1]) cube([length,25+8.5,height+2]);
        translate([length-45,0.9,3]) cube([40,25+12.5+6.4,height+.2]);
        translate([-0.1,0,3]) rotate([33,0,0]) cube([60,60,30]);
        rotate([0,0,180+45]) translate([-4.7,-6,-0.1]) cube([5,20,10]);
        translate([47.5,-8.8,-3]) rotate([0,0,90]) z_bottom_holes();
        // zlimit switch wire hole
        translate([-1,depth-12,9]) rotate([0,90,0]) cylinder(20,4.5,4.5, $fn=24);
        translate([52-25.5,50-12,20]) micro_switch_10T85_screwHoles();        
    }
}

translate([0,0,0]) {
    difference() {
        mk3_zlimit_switch_holder();
        translate([11.5,46,5]) 
            rotate([90,0,0]) 
                linear_extrude(2) 
                    text("Noami3", size=7);    
        
    }    
}

