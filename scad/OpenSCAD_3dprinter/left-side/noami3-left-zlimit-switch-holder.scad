/**
 * noami3 left Z Limit switch holder part of the PINDA eliminator project
 * 
 * Neeraj Verma April 2020
 */
 

use <../../OpenSCAD_electronics/switches/micro_switch_10T85.scad> // https://github.com/numberformat/OpenSCAD_electronics
use <../right-side/noami3-right-zlimit-switch-holder.scad>
use <../right-side/noami3-right-zlimit-switch-holder-scene.scad>


module mk3_zlimit_switch_holder_left() {
    mirror([1,0,0]) {
        difference() 
        {
            mk3_zlimit_switch_holder();        
            translate([-0.1,46.9,-0.1]) cube([55,5,17.1]);
            translate([-0.1,49.1,14.8]) rotate([50,0,0]) cube([55,5,3]);
        }
    }
}

mk3_zlimit_switch_holder_left();


