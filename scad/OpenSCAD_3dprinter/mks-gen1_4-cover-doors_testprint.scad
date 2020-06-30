use<mks-gen1_4-cover-doors.scad>;

difference() {
  mks_gen1_4_doors();
  translate([-1,-1,-1]) cube([1000,82,20]); 
}

