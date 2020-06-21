use <bearing.scad>

difference() {
    
    rotate([0,0,45]) cube([30,30,5], center=true);
    translate([4.5,-4.5,-4]) vertical_bearing_holes();
}