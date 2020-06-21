/**
 * noami3 Project
 * 
 * This is a Scene file that shows all related components and how they
 * fit with each other.
 */
use <../../OpenSCAD_electronics/switches/micro_switch_10T85.scad>
use <../z-axis-bottom.scad>
use <x-end-idler.scad>
use <noami3-right-zlimit-switch-holder.scad>

module right_linear_rod() {
    translate([0,0,-40]) cylinder(200,4,4, $fn=25);
}
module xend() {
    x_end_idler_chamfered();
    right_linear_rod();
}

translate([44.4,20.4,100]) rotate([180,0,-90]) xend();
translate([52-25.5,50-12,20]) micro_switch_10T85();
translate([52-4.5,50,0]) rotate([180,0,-90]) z_bottom_right();

mk3_zlimit_switch_holder();
