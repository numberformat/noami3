// PRUSA iteration3
// RAMBo doors
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

width=105.5;
depth=87.5;
height=20;

module body()
{
    // side panels
    cube( [ width , depth , 1 ] );  
    cube( [ width , 2 , height ] );  
    cube( [ 2 , depth , height ] );   

    // corner reinforcement
    translate( [ width-(width-98) , 1 , 0 ] ) cube( [ 7.5 , 5 , height ] );   
    translate( [ 0.5 , 0.5 , 0 ] ) cube( [ 5 , 6.5 , height ] );  
    translate( [ 1 , 0 , 0 ] ) cube( [ 10 , depth , 6 ] );   
    translate( [ width-(width-99.5) , 0 , 0 ] ) cube( [ 6 , depth , 7 ] ); 
    translate( [ 10 , 0 , 0 ] ) cube( [ 6 , 5 , 6 ] );   

    // screw thread body
    translate( [ width-(width-54) , 2 , 0 ] ) cube( [ 9.5 , 6 , height ] ); 

    // rounded side
    translate( [ 0 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = width, r = 4.5, $fn=30);

    // upper hinge reinforcement
    translate( [ width-(width-0.5) , 69 , -9 ] ) rotate([20,0,0]) cube( [ 26 , 20 , 10 ] ); 
    
    // door closing
    translate( [ 4 , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30);  
    translate( [ width-(width-102) , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30); 
}

module ventilation_holes()
    {
     for ( i = [0 : 9] ){
      translate([46 + (i*5.5),10.5,-1]) cube([3.65,19+50,1.2]);
      translate([46 + (i*5.5),10.5,-1]) cube([3.65,19,10]);
      translate([46 + (i*5.5),10.5+25,-1]) cube([3.65,19,10]);
      translate([46 + (i*5.5),10.5+50,-1]) cube([3.65,19,10]);
    }
    for ( i = [0 : -6] ){
      translate([46 + (i*5.5),10.5,-1]) cube([3.65,19+50,1.2]);
    }
    for ( i = [-6 : -7] ){
      translate([46 + (i*5.5),20.5,-1]) cube([3.65,19+40,1.2]);
    }
}

module cutouts()
{
    // door closing screw
    translate( [ width-(width-58.5) , 4 , 5 ] ) cylinder( h = 17, r = 1.8, $fn=30);  
    translate( [ width-(width-58.5) , 4 , 18.5 ] ) cylinder( h = 2.6, r1 = 1.8, r2=2.2, $fn=30); 
    translate( [ width-(width-58.5) , 4 ,15.5] ){
    translate( [ 0 , 0 , 2.5 ] ) cube([5.7,3.8,1], center=true);
    translate( [ 0 , 0 , 3 ] ) cube([3.8,3.8,1], center=true);}

    ventilation_holes();
    
    // rounded side cutoff    
    translate( [ 26.5 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 73, r = 3.5, $fn=30);   
    translate([ 26.5 ,80,5]) cube([width-(width-73),19,10]); 
    translate([ 26.5 ,82.5,1]) cube([width-(width-73),5,10]); 
    
    // upper hinge cut
    translate( [ 0 , 60 , -10 ] ) cube( [ 30 , 30 , 10 ] );  
    translate( [ -1 , depth , 0 ] ) cube( [ 22.5 , 10 , 10 ] ); 

    // upper hinge 
    translate( [2 , 80, 6] ) cube( [ 19.5, 10 , 10 ] );       
    translate( [-2 , 89.7, 3] ) rotate([70,0,0]) cube( [ 19.5, 10 , 5 ] );     
    translate( [ -5 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 26.5, r = 2.5, $fn=30);  

    // hinge hole
    translate( [ -5 , depth , 4.5 ] ) rotate([0,90,0]) cylinder( h = 120, r = 2.6, $fn=30);  

    // door closing 
    translate( [ 4 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  
    translate( [ 102 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  

    // M3 NUT
    translate( [55.65 , 0.5, 16] ) cube( [ 5.7, 10 , 2.2 ] );  

    // side panel lightning slot
    translate( [2 , 10, 3] ) cube( [ 7, 65 , 5 ] );  
    #translate( [101 , 10, 3] ) cube( [ 3, 70 , 5 ] );  

    // corners - cut
    translate( [53 , 3, 1] ) rotate([0,0,70]) cube( [ 10, 10 , 50 ] );  
    translate( [61 , 12, 1] ) rotate([0,0,-70]) cube( [ 10, 10 , 50 ] );  
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
    }
}
 
mks_gen1_4_doors();
    
    
    
    
    
    
    
    
    
    
