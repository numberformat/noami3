// PRUSA iteration4
// RAMBo doors
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <skr_1_3-base.scad>

offsetx=12.5;
offsety=10.5;
depth=98;  // NV: 
doorClosingScrewOffset=-27.2;

mk3_frame = false;
height = (mk3_frame) ? 12 : 17;
door_closing_offset=60;
lower_hinge_offset=47;

module body()
{
    // side panels
    cube([105.5+offsetx,87.5+offsety,1.5]);  
    cube([105.5+offsetx,2,height]);  
    cube([2,89.5+offsety,height]);   

    // corner reinforcement
    translate([98+offsetx,1,0]) cube([7.5,5,height]);   
    translate([0.5,0.5,0]) cube([5,6.5,height]);  
    translate([1,0,0]) cube([10,87.5+offsety,6]);   
    translate([99.5+offsetx,0,0]) cube([6,87.5+offsety,7]); 
    translate([10,0,0]) cube([6,5,6]);   

    // screw thread body
    translate([54+doorClosingScrewOffset,2,0]) cube([9.5,6,height]); 

    // rounded side
    translate([0,87.5+offsety,4.5]) rotate([0,90,0]) cylinder( h = 105.5+offsetx,r = 4.5,$fn=30);

    // upper hinge reinforcement
    translate([0.5,69+offsety,-9]) rotate([20,0,0]) cube([26+offsetx,20,10]); 
    
    // door closing
    translate([4,3.5,height-3.2]) cylinder( h = 3.2,r1 = 1.8,r2= 3.5,$fn=30);  
    translate([102+offsetx,3.5,height-3.2]) cylinder( h = 3.2,r1 = 1.8,r2= 3.5,$fn=30); 
}

module ventilation_holes()
{
        for ( i = [0 : 9] )
            {
                translate([40 + (i*6),10.5,-1]) cube([3.65,19+50,1.2]);
                translate([40 + (i*6),10.5,-1]) cube([3.65,19,10]);
                translate([40 + (i*6),10.5+25,-1]) cube([3.65,19,10]);
                translate([40 + (i*6),10.5+50,-1]) cube([3.65,19,10]);
            }
        for ( i = [0 : -4] )
            {
                translate([40 + (i*6),10.5,-1]) cube([3.65,19+50,1.2]);
            }
        for ( i = [-6 : -7] )
            {
                translate([46 + (i*6),20.5,-1]) cube([3.65,19+40,1.2]);
            }
    translate([15,10,1]) cube([20,55,1.5]);  
}

module doorClosingScrewCoutouts() {
    // door closing screw
    translate([58.5,4,height-15]) cylinder( h = 18,r = 1.8,$fn=30);  
    translate([58.5,4,height-1.5]) cylinder( h = 2.6,r1 = 1.8,r2=2.2,$fn=30); 
    translate([58.5,4,height-4.5] ){
    translate([0,height-17.5,2.5]) cube([5.7,3.8,1],center=true);
    translate([0,height-17,3]) cube([3.8,3.8,1],center=true);}    
    // M3 NUT
    translate( [55.65,0.5,height-4.1] ) cube([5.7,10,2.4]);      // NV: extra
}

module roundedSideCutouts() {
    // rounded side cutoff    
    translate([26.5,87.5,4.5]) rotate([0,90,0]) cylinder( h = 73,r = 3.5,$fn=30);   
    translate([ 26.5,80,5]) cube([73,19,10]); 
    translate([ 26.5,82.5,1]) cube([73,5,10]);     
}
module cornerCutouts() {
    // corners - cut
    translate( [53+doorClosingScrewOffset,3,1.5] ) rotate([0,0,70]) cube([10,10,50]);  
    translate( [61+doorClosingScrewOffset,12,1.5] ) rotate([0,0,-70]) cube([10,10,50]);  
    translate( [16,2,1.5] ) rotate([0,0,45]) cube([5,5,50]);      
}


module upperHingeCutouts() {
    // upper hinge cut
    translate([0,60,-10]) cube([30+offsetx,30,10]);  
    translate([-1,80,-1]) rotate([-45,0,0]) cube([22.5+offsetx,8,18]);     
}


module upperHinge2Cutouts() {
    // upper hinge 
    translate( [2,80,6] ) cube([19.5+offsetx,10,10]);       
    translate( [-2,88,5] ) rotate([50,0,0]) cube([19.5,10,5]);     
    translate([-5,87.5,4.5]) rotate([0,90,0]) cylinder( h = 26.5,r = 2.5,$fn=30);  
    translate([-5,87.5,4.5]) rotate([0,90,0]) cylinder( h = 26.5+offsetx,r = 5,$fn=30);      
}

module cutouts()
{
    translate([doorClosingScrewOffset,0,0]) doorClosingScrewCoutouts();
    ventilation_holes();
    
    translate([offsetx,offsety,0]) roundedSideCutouts();
    translate([0,offsety,0]) upperHingeCutouts();
    translate([0+1,offsety,0])upperHinge2Cutouts();
    
    // hinge hole
    translate([-5,87.5+offsety,4.5]) rotate([0,90,0]) cylinder( h = 130,r = 2.7,$fn=30);  

    // door closing 
    translate([4,3.5,height-3.1]) cylinder( h = 3.2,r1 = 1.2,r2= 2.8,$fn=30);  
    translate([102+offsetx,3.5,height-3.1]) cylinder( h = 3.2,r1 = 1.2,r2= 2.8,$fn=30);  

    // side panel lightning slot
    translate( [2,10,3] ) cube([7,65,5]);  
    translate( [101,10,3] ) cube([3,70,5]);  

    cornerCutouts();
}



module RAMBo_doors()
{
difference()
{
    body();
    cutouts();
    // large corner cut
    translate( [0,-20,-3] ) rotate([0,45,45]) cube([30,30,20]);  

    translate([30+offsetx,75+offsety,1]) rotate([0,0,0]) linear_extrude(height = 0.8) 
    { text("NOAMi3 SKR V1.3",font = "helvetica:style=Bold",size=5.5,center=true); }    
}
}
 
// test fit helpers
/*
  use<skr_1_3-base.scad>
  if(mk3_frame) {
    rotate([180,0,0]) translate([0,-103.2,-47.1]) skr_1_3_base();
  } else {
    rotate([180,0,0]) translate([0,-103.2,-55.1]) skr_1_3_base();
  }
  //use<Rambo-doors.scad>
  //translate([0,11.2,0]) RAMBo_doors();
  use<mks-gen1_4-Hinges.scad>
  rotate([90,0,-90]) translate([-depth,-1.5,-128.5]) lower_hinge();
  rotate([-90,0,-90]) translate([-depth,-4.5,13.5]) upper_hinge();
  if(mk3_frame) {
    translate([225.4,103,47.5]) rotate([90,90,180]) import("H:/hobby/3dPrinting/noami3PruisaMK2_incoming/MK3_frame.stl");
  } else {
    //translate([10.5,106.2,52]) rotate([90,90,180]) import("H:/hobby/3dPrinting/noami3PruisaMK2_incoming/MK2S_frame.stl");
  }
*/ 
RAMBo_doors();

//%translate([0,103,55]) rotate([180,0,0]) mks_gen1_4_base();
  
    
    
    
    
    
    
    
    
    