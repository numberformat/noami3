//translate ([86.6,48.2,5]) rotate(180) import("lib/RB-MKS_Gen_1.4.stl");

use <../../modules/OpenSCAD_electronics/printer_components/mks_gen_1_4.scad>
translate ([153.5,94.2,8]) rotate(180) %mksGen14();
  
// PRUSA iteration4
// RAMBo base
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

width=165.5;
height=35;
depth=103.2;
heatbedHolderOffset=-41;
extruderHolderOffset=11;


// main body
module main_body()
{
  
    // side panel
    cube([width,depth,2]);  

    // upper panel
    cube([1.5,depth,height]);  

    // rear panel
    translate( [0,depth-2,0]) cube([width-13,2,height]);  
    
    // upper panel frame reinforcement
    translate([0,0,1]) cube([5.5,7+extruderHolderOffset,height-1]);  

    // side panel reinforcement
    translate([0,0,1]) cube([9,depth,3]);  
    translate([width-20.5,0,0]) cube([9,depth,4]); 
    
    // raspberry
    //translate([21,81,0]) cylinder( h = 4.5,r = 2.5,$fn=30);   
    //translate([21+58,81,0]) cylinder( h = 4.5,r = 2.5,$fn=30); 
   
    heatbed_mounting_reinforcement(heatbedHolderOffset);

   

    difference()
    {
        // bottom side reinforcement    
        translate([width-20.5,depth-6,0]) cube([7.5,6,height]); 
        translate([width-22.5,depth-13,0]) rotate([0,0,45]) cube([7.5,6,height+1]); 
    }
    translate([0,depth-7,0]) cube([5.5,7,height]); 


    // frame side panel
    translate([10,0,0]) cube([width-28.5,3,5]);  

    // RAMBo mounting holes
    translate([width-16,14,1]) rotate([0,0,90]) cylinder( h = 7,r = 5.5,$fn=6); 
    translate([width-16,depth-13,1]) rotate([0,0,90]) cylinder( h = 7,r = 5.5,$fn=6); 
    translate([14.5,14,1]) cylinder( h = 7,r = 5.5,$fn=6); 
    translate([14.5,depth-13,1]) cylinder( h = 7,r = 5.5,$fn=6); 

    // corners reinforcement
    translate([0,depth-17,1]) cube([13,16,6]);  
    translate([0,depth-21.75,1]) cube([7.5,11,6]); 
    translate([0,7.75,1]) cube([7.5,11,6]); 
    translate([0,0,1]) cube([13,14,6]); 

    // frame mounting screw blocks
    //upper
    translate([width-117.5,0,0]) cube([28,4,10]);  
    translate([width-100.05,0,0]) cube([3,4,5.5] ); 

    //lower
    translate([width-20.5,0,0]) cube([20.5,4,10]); 

    // door closing corner
    translate([width-16.5,depth-3.5,35]) cylinder( h = 3,r1=2.5,r2=1,$fn=30);   

    // doors pin upper
    translate([2,depth-7,height-4]) cube([6,7,4] ); 
    translate([4,depth-3.5,height]) cylinder( h = 3,r1=2.5,r2=1,$fn=30);   

    // x-axis cables entry hole body
    translate([width-29.5,2,0]) cylinder( h = 5,r = 6,$fn=6);   
    
    extruder_cable_holder(extruderHolderOffset);
    
}

module extruder_cable_holder(offset) {
    // extruder cable holder
    translate([0,offset+0,15]) cube([5,40,20]);  
    translate([5,offset+28,28]) rotate([0,90,0]) cylinder(h=5,r1=10,r2=8,$fn=30);  
    difference()
    {
        translate([-2,offset+0,28]) rotate([0,45,0]) cube([9.8,25,9.8]);  
        translate([-5,offset-5,15]) cube([5,40,20]);  
        translate([10,offset-5,15]) cube([5,40,20]);  
    }
    translate([-6,offset+28,28]) rotate([0,90,0]) cylinder(h=6,r=13,$fn=30);  
    translate([-10,offset+28,28]) rotate([0,90,0]) cylinder(h=4,r1=8,r2=13,$fn=30);  
    difference()
    {
        translate([-5.5,offset+23.5,16]) rotate([0,45,0]) cube([8,9,8]);  
        translate([1,offset+0,10]) cube([5,40,20]); 
    }

}

module heatbed_mounting_reinforcement(offset){
       // heatbed cable mounting reinforcement
    translate([offset+width-55.5,  depth-6,    0.5]) cube([15,5,34.5]); 
    translate([offset+width-43.5,  depth+7,         28]) rotate([90,0,0]) 
        cylinder(h=15,r=13,$fn=30); 
    translate([offset+width-43.5,    depth+9,        28]) rotate([90,0,0]) 
        cylinder(h=2,r1=9,r2=13,$fn=30); 
    translate([offset+width-48.2,  depth-4,         13.2]) rotate([-45,0,0]) cube([9.5,5,9]); 
    translate([offset+width-48.2,  depth-8,         16.2]) rotate([-45,0,0]) cube([9.5,8,5]); 

    // screw mounting block
    translate([offset+width-64.5,depth-8,0]) cube([11,7,height]);      
}


module ventilation_holes()
{
     for ( i = [-6 : 14] )
        {
            translate([46 + (i*5.5),10.5,-1]) cube([3.65,19+49.0,1.2]);
            translate([46 + (i*5.5),10.5,-1]) cube([3.65,18,10]);
            translate([46 + (i*5.5),10.5+25,-1]) cube([3.65,18,10]);
            translate([46 + (i*5.5),10.5+50,-1]) cube([3.65,18,10]);
        }
}


module cutouts(){
    
    
    extruder_cable_holder_cutout(extruderHolderOffset);
    
    // side     
    translate([12,19,1]) cube([width-33,depth-41,3]);   

    // RAMBo M3 screws
    translate([14.5,14,-1]) cylinder( h = 10,r = 1.9,$fn=30);  
    translate([width-16,14,-1]) cylinder( h = 10,r = 1.9,$fn=30);  
    translate([width-16,depth-13,-1]) cylinder( h = 10,r = 1.9,$fn=30);  
    translate([14.5,depth-13,-1]) cylinder( h = 10,r = 1.9,$fn=30);     

    translate([14.5,14,6]) cylinder( h = 3,r1 = 1.9,r2=2.4,$fn=30);  
    translate([width-16,14,6]) cylinder( h = 3,r1 = 1.9,r2=2.4,$fn=30);  
    translate([14.5,depth-13,6]) cylinder( h = 3,r1 = 1.9,r2=2.4,$fn=30);     

    translate([12,6,0])ventilation_holes();
    
    // frame mounting screws
    //upper    
    translate([width-100,-2,15.6]) rotate([0,45,0]) cube([15,10,10] );     
    translate([width-102,8,5]) rotate([90,0,0]) cylinder( h = 10,r = 1.6,$fn=30);   
    translate([width-102,9,5]) rotate([90,0,0]) cylinder( h = 5,r = 3,$fn=30);   
    translate([width-103.35,-2,5]) cube([2.7,15,10] ); 
    translate([width-103.4,-2,7]) rotate([0,5,0]) cube([2.8,15,10] ); 
    translate([width-103.4,-2,7]) rotate([0,-5,0]) cube([2.8,15,10] ); 


    //lower
    translate([width-8,9,5]) rotate([90,0,0]) cylinder( h = 10,r = 1.6,$fn=30);   
    translate([width-8,9,5]) rotate([90,0,0]) cylinder( h = 5,r = 3,$fn=30);       
    translate([width,-2,6]) rotate([0,-45,0]) cube([5,15,15] ); 
    translate([width-4,-2,8.5]) rotate([0,45,0]) cube([5,8,15] ); 
    translate([0,-2,-5]) cube([width+1.5,15,5] ); 
    translate([width-9.35,-2,5]) cube([2.7,15,10] ); 
    translate([width-9.2,-2,6.5]) rotate([0,5,0]) cube([2.5,15,10] ); 
    translate([width-9.3,-2,6.5]) rotate([0,-5,0]) cube([2.5,15,10] ); 

    // USB connector hole
    translate([width-32.7,depth-4,7]) rotate ([0,0,90]) cube([5.5,14,14]);   // todo

    // reset button
    //translate([-2,65,14]) rotate([0,90,0]) cylinder( h = 10,r = 2,$fn=30);  

    new_heatbed_cable_holder_cutout(heatbedHolderOffset);

    // nut traps HEX  
    translate([14.5,14,-1]){
    cylinder( h = 4,r = 3.2,$fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    }

    translate([width-16,14,-1]){
    cylinder( h = 4,r = 3.2,$fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    }
        translate([width-16,depth-13,-1]){
        cylinder( h = 4,r = 3.2,$fn=6);  
        rotate([0,0,0]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
        rotate([0,0,60]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
        rotate([0,0,120]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
        }

    translate([14.5,depth-14,-1]){
    cylinder( h = 4,r = 3.2,$fn=6);  
    rotate([0,0,0]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,60]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    rotate([0,0,120]) resize([0,2,0]) cylinder( h = 4,r = 3.5,$fn=6);  
    }

    translate([14.5,14,-1]) cylinder( h = 1.5,r1 = 6,r2=3.2,$fn=6);  
    translate([width-16,14,-1]) cylinder( h = 1.5,r1 = 6,r2=3.2,$fn=6);  
    translate([width-16,depth-13,-1]) cylinder( h = 1.5,r1 = 6,r2=3.2,$fn=6);  
    translate([14.5,depth-14,-1]) cylinder( h = 1.5,r1 = 6,r2=3.2,$fn=6);  

    // door closing corners
    translate([8,depth-12,28]) rotate([0,0,45]) cube([5,5,10] ); 
    translate([width-12.5,depth-11,4]) rotate([0,0,45]) cube([5,5,40] ); 

    // inner edges cutout
    translate([6,depth-12,7]) rotate([0,0,45]) cube([5,5,24] ); 

    // x axis cable hole
    translate([width-29.5,2,-1]) cylinder( h = 10,r = 4,$fn=6);   
    translate([width-38.5,-5,-1]) cube([15,5,10] ); 

    // large corner coutout
    translate([-27,depth-12,-54]) rotate([50,0,45]) cube([50,50,50] ); 
    translate([width+19,depth-32,-10]) rotate([0,0,45]) cube([50,50,50] ); 
}


module extruder_cable_holder_cutout(offset) {
    // extruder cable holder
    translate([1.5,offset+7,14.8]) rotate([0,45,0]) cube([3,40,5]); 
    translate([-20,offset+28,28]) rotate([0,90,0]) cylinder( h = 40,r = 5.5,$fn=30); 
    translate([-15,offset+7,35]) cube([30,40,15]); 
    translate([-15,offset+25,30]) cube([30,6,8]); 
    
    translate([-15,offset+12,28]) cube([15,30,8]); 
    translate([-12,offset+16.5,28]) cube([15,23,8]); 
    translate([-3,offset+28,28]) rotate([35,90,0]) cylinder( h = 24,r = 1.6,$fn=30); 
    
    translate([-2.7,offset+20.0,22]) rotate([0,0,90]) cylinder( h = 10,r = 1.6,$fn=30); 
    translate([-2.7,offset+20.0,12]) rotate([0,0,90]) cylinder( h = 13,r = 3.1,$fn=6); 
    translate([-2.7,offset+36,10]) rotate([0,0,90]) cylinder( h = 33,r = 1.6,$fn=30); 
    translate([-2.7,offset+36,12]) rotate([0,0,90]) cylinder( h = 13,r = 3.1,$fn=6); 

}    

module new_heatbed_cable_holder_cutout(offset) {    
    // new heatbed cable holder
    // door closing screw
    translate([offset+width-60,depth-4,-1]) cylinder( h = 43,r = 1.9,$fn=30);    
    translate([offset+width-43.5,depth+13,28]) rotate([90,90,0]) cylinder(h=30,r=4.0,$fn=30); 
    translate([offset+width-51.5,depth+3,15.5]) rotate([0,0,0]) cylinder(h=10,r=3.2,$fn=6); 
    translate([offset+width-35.5,depth+3,15.5]) rotate([0,0,0]) cylinder(h=10,r=3.2,$fn=6); 
    translate([offset+width-51.5,depth+3,14]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30); 
    translate([offset+width-35.5,depth+3,14]) rotate([0,0,0]) cylinder(h=15,r=1.6,$fn=30);
    translate([offset+width-58.5,depth,28]) cube([30,13,14]);  
    translate([offset+width-58.5,depth-12,35]) cube([30,13,14]);
    translate([offset+width-46,depth-12,30]) cube([5,13,14]);
    translate([offset+width-43.5,depth,25]) rotate([120,0,0]) cylinder(h=25,r=1.6,$fn=30);
    translate([offset+width-56,depth-4,28]) cube([25,15,14]);    
    translate([offset+width-60,depth-4,-1]) cylinder( h = 4,r = 3.2,$fn=30);       
    translate([offset+width-64.5,depth-12,2]) rotate([0,0,45]) cube([5,5,50] ); 
    
}

module mks_gen1_4_base()
{
    difference()
    {
            difference()
            {
                main_body();
                cutouts();
            }
            translate([width-16,depth-13,6]) cylinder( h = 3,r1 = 1.9,r2=2.4,$fn=30);  
       
            //BottomCubic();
            //translate([14.5,10,-2]) cube([4,24,10]); 
            //translate([16.5,10,-2]) cylinder( h = 20,r = 2,$fn=30);  
            //translate([16.5,34,-2]) cylinder( h = 20,r = 2,$fn=30);  
            
            // lightening slots
            translate([100,21,2] ) cube([5,48,5]);     
            translate([3,21,2] ) cube([4.5,48,5]);     

            translate([width-3.5,depth-72,1.5]) rotate([0,0,90]) linear_extrude(height = 0.8) 
            {text("www.NOAMi.us",font = "helvetica:style=Bold",size=6,center=true); }    
    }
}





mks_gen1_4_base();









