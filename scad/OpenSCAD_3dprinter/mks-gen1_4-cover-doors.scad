// PRUSA iteration3
// RAMBo doors
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

// NV: from MK2.5 design

mk3_frame=false;

width=152.5; // NV: for mksgen 1.4
depth=98.7;  // NV: for mksgen 1.4
height = (mk3_frame) ? 12 : 17;


door_closing_offset=60;
lower_hinge_offset=47;

module body()
{
    // side panels
    cube( [ width-1.5 , depth , 1 ] );  
    cube( [ width , 2 , height ] );  
    cube( [ 2 , depth+2 , height ] );   

    // corner reinforcement
    // xxx
    translate( [ width-7.5 , 1 , 0 ] ) cube( [ 7.5 , 5 , height ] );   
    translate( [ width-(lower_hinge_offset+7.5) , 1 , 0 ] ) cube( [ 7.5 , 5 , height ] );   
    
    translate( [ 0.5 , 0.5 , 0 ] ) cube( [ 5 , 6.5 , height ] );    
    translate( [ 1 , 0 , 0 ] ) cube( [ 10 , depth , 6 ] );   
    
    translate( [ width - 7.5 , 0 , 0 ] ) cube( [ 6 , depth , 7 ] ); 
    //#translate( [ width - (lower_hinge_offset+6) , depth-15 , 0 ] ) cube( [ width-99.5 , 15 , 7 ] ); 
   
    translate( [ 10 , 0 , 0 ] ) cube( [ 6 , 5 , 6 ] );   

    // screw thread body NV: door closing reinforcement
    translate( [ width-(width-door_closing_offset) , 2 , 0 ] ) cube( [ 9.5 , 6 , height ] ); 

    // rounded side
    translate( [ 0 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = width-1.5, r = 4.5, $fn=30);

    // upper hinge reinforcement
    translate( [ width-(width-0.5) , depth-18.5 , -9 ] ) rotate([20,0,0]) cube( [ 74.5 , 20 , 10 ] ); 
    // NV: lower hinge reinforcement 
    translate( [ width-12 , depth-18.5 , -9 ] ) rotate([20,0,0]) cube( [ 10 , 20 , 10 ] ); 
    
    // door closing
    translate( [ 4 , 3.5 , height-3.2 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30);  
    // NV: 
    
    #translate( [ width-3.5, 3.5 , height-3.2 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30); 
    translate( [ width-(lower_hinge_offset+3.5), 3.5 , height-3.2 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30); 
}

module ventilation_holes()
    {
    offset = 16;
     for ( i = [0 : 22] ){
      translate([offset + (i*5.5),10.5,-1]) cube([3.65,19+50,1.2]);
      translate([offset + (i*5.5),10.5,-1]) cube([3.65,19,10]);
      translate([offset + (i*5.5),10.5+25,-1]) cube([3.65,19,10]);
      translate([offset + (i*5.5),10.5+50,-1]) cube([3.65,19,10]);
    }
}

module cutouts()
{
    // door closing screw xxx
    translate( [ width-(width-door_closing_offset-4.5) , 4 , height-15 ] ) cylinder( h = 17, r = 1.8, $fn=30);  
    translate( [ width-(width-door_closing_offset-4.5) , 4 , height-1.5 ] ) cylinder( h = 2.6, r1 = 1.8, r2=2.2, $fn=30); 
    translate( [ width-(width-door_closing_offset-4.5) , 4 ,height-4.5] ){
    translate( [ 0 , 0 , height-17.5 ] ) cube([5.7,3.8,1], center=true);
    translate( [ 0 , 0 , height-17 ] ) cube([3.8,3.8,1], center=true);}

    ventilation_holes();
    
    // rounded side cutoff    
    translate( [ 75 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 67.5, r = 3.5, $fn=30);   
    translate([ 76.5 ,depth-7.5,5]) cube([width-87,19,10]); 
    translate([ 76.5 ,depth-7.5,.7]) cube([width-87,5,10]); 
    //translate([ 105.5 ,depth-7.5,1]) cube([width-(width-73),5,10]);  // NV: added

    translate([ 75,depth-7.5,5]) cube([width-85,19,10]); 
    //translate([ 105.5 ,depth-7.5,-.2]) cube([width-(width-73),19,10]); // NV: added
    translate([ 75 ,depth-7.5,1]) cube([width-85,5,10]); 

    
    // upper hinge cut
    translate( [ 0 , depth-25 , -10 ] ) cube( [ 80 , 30 , 10 ] );  
    translate( [ width-lower_hinge_offset-10 , depth-25 , -10 ] ) cube( [ 65 , 30 , 10 ] );  
    //#translate([-1,depth-7.5,-1]) rotate([-45,0,0]) cube([68.5,8,18]); 
    translate([38.75,depth-7.5,-1]) rotate([-45,0,0]) cube([28.75,8,18]); 

    // upper hinge 
    translate( [2 , 80, 6] ) cube( [ 19.5, 10 , 10 ] );       
    translate( [2 , depth-1.2, 3] ) rotate([50,0,0]) cube( [ 65.5, 12 , 5 ] );     
    translate( [ 2 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 170, r = 2.7, $fn=30);  // NV: made hole bigger
    translate([38.75,depth,4.5]) rotate([0,90,0]) cylinder( h = 28.75,r = 5,$fn=30);  

    // hinge hole
    translate( [ 2 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 200, r = 2.6, $fn=30);  

    // door closing 
    translate( [ 4 , 3.5 , height-3.1 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  
    
    translate( [ width-3.5 , 3.5 , height-3.1 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  

    // M3 NUT
    translate( [door_closing_offset+1.55 , 0.5, height-4.1] ) cube( [ 5.75, 10 , 2.3 ] );   // NV: made more room for nut

    // side panel lightning slot
    translate( [2 , 10, 3] ) cube( [ 7, 65 , 5 ] );  
    translate( [width-6.5 , 10, 3] ) cube( [ 3, depth-17.5 , 5 ] );   // xxx

    // corners - cut
    translate( [door_closing_offset-1 , 3, 1] ) rotate([0,0,70]) cube( [ 10, 10 , 50 ] );  
    translate( [door_closing_offset+7 , 12, 1] ) rotate([0,0,-70]) cube( [ 10, 10 , 50 ] );  
    translate( [16 , 2, 1] ) rotate([0,0,45]) cube( [ 5, 5 , 50 ] );  

}

module mks_gen1_4_doors()
{
difference()
{
    body();
    cutouts();
    // large corner cut
    translate( [0 , -20, -3] ) rotate([0,45,45]) cube( [ 30, 30 , 20 ] );  
    translate([78,depth-16,0.5]) rotate([0,0,0]) linear_extrude(height = 0.8) 
    {text("NOAMi3 MKS Gen 1.4",font = "helvetica:style=Bold",size=4,center=true); }    
}

}
 
// test fit helpers

  use<mks-gen1_4-base.scad>
  if(mk3_frame) {
    rotate([180,0,0]) translate([0,-103.2,-47.1]) mks_gen1_4_base();
  } else {
    rotate([180,0,0]) translate([0,-103.2,-52.1]) mks_gen1_4_base();
  }
  //use<Rambo-doors.scad>
  //translate([0,11.2,0]) RAMBo_doors();
  use<mks-gen1_4-Hinges.scad>
  rotate([90,0,-90]) translate([-depth,-1.5,-152.5-9.1]) lower_hinge();
  rotate([-90,0,-90]) translate([-depth,-4.5,152.5-106]) upper_hinge();
  if(mk3_frame) {
    %translate([225.4,103,47.5]) rotate([90,90,180]) import("H:/hobby/3dPrinting/noami3PruisaMK2_incoming/MK3_frame.stl");
  } else {
    %translate([43.4,103,52.5]) rotate([90,90,180]) import("H:/hobby/3dPrinting/noami3PruisaMK2_incoming/MK2S_frame.stl");
  }


  //translate([0,100,-2.5]) cube([10,10,50]);
mks_gen1_4_doors();
    
    