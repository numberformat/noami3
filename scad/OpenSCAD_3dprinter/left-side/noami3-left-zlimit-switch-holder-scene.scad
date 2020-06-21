/**
 * noami3 Project
 * 
 * This is a Scene file that shows all related components and how they
 * fit with each other.
 * Neeraj Verma - March 2020
 */
use <../../OpenSCAD_electronics/switches/micro_switch_10T85.scad>
use <../z-axis-bottom.scad>
use <../right-side/noami3-right-zlimit-switch-holder.scad>
use <x-end-motor.scad>

module xend() {
    x_end_idler_chamfered();
    translate([0,0,-40]) cylinder(200,4,4, $fn=25);
}

mirror([1,0,0]) translate([44.4,20.4,100]) rotate([180,0,-90]) xend();
mirror([1,0,0]) translate([52-25.5,50-12,20]) micro_switch_10T85();
mirror([1,0,0]) translate([52-4.5,50,0]) rotate([180,0,-90]) z_bottom_right();

mirror([1,0,0]) mk3_zlimit_switch_holder();

translate([-44.4,20.4,100]) rotate([180,0,-90]) x_end_motor();