cylinder(h=10, r=10,$fn=6);
translate([16.5,9.8,0]) cylinder(h=10, r=10,$fn=6);
translate([16.5,-9.8,0]) cylinder(h=10, r=10,$fn=6);

linear_extrude(height=10) translate ([30,-5,0]) text("NOAMi3");