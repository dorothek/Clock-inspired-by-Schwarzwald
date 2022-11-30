//Zegar    
#include "colors.inc"  
#include "woods.inc"  
#include "shapes.inc"  
                          

sky_sphere{
    pigment{
        gradient y
        color_map{
            [0 White]
            [1 Blue]
        }
        scale 2
        translate -1
    }
} 

plane {
y, -13
pigment{Green}
}
#switch (clock)
    #range(0, 240)
        #declare X_movement = -10+(18/240)*clock;
        #declare Z_movement = -20+(5/240)*clock;
       #break 
    #range(240, 310) 
        #declare X_movement = 8-(8/70)*(clock-240);
        #declare Z_movement = -15;
       #break
    #else  
        #declare X_movement = 0; 
        #declare Z_movement = -15+(10/50)*(clock-310);
#end
  
camera{location <X_movement,2,Z_movement> look_at<0,2,0>} 
background{White}
//--------------------LIGHT SOURCES  
#declare Sun_set = 100-(108/240)*clock;   
 #switch (Sun_set)
  #range (10,100)
     #declare Brightness = White;
  #break
  #range (-30,10)
     #declare Brightness = White*0.3;  //rgb -> 000
  #break
  #else
     #declare Brightness = Black;
 #end
#declare Day_Light=object{light_source {<100,Sun_set,-100>, Brightness}} 
#declare Candles_Light=object{union{light_source{<5.01,2.77,0.3>, color Yellow*0.2
fade_distance 5
fade_power 3} 
light_source{<-4.25,-0.5,-0.35>, color Yellow*0.1
fade_distance 5
fade_power 3} 
}        
}
 
 
//-----------------------------------------POLKA
#declare Shelf= object{
//pó³ka
box{<2,-1,0>,<4,-0.7, 1.5>
texture {T_Wood12}
}
}
//----------------------------------------Koniec polki

#declare Clock= object{
//pud³o zegara
union{   
union{ 
object{ 
Round_Box(<0,0,0>, <1.5,1.5,1.5>, 0.15, 0)
   rotate<0,0,45>
   translate<0,-0.2,0>     
}
object{
Round_Box(<-1,-1,0>, <1,1,1.5>, 0.15, 0)
}
texture{ T_Wood20 scale 3}     
}

//koniec pud³a  
 
//tarcza zegara
cone{<0,0,-0.01>, 0.73, <0,0,1>, 0.73
    pigment {White*2}  
    finish {ambient 0.15}}  

difference{
union{
#declare i=0;
#while(i<360)    
    triangle {<0,0,-0.011>, <-0.003,0.67,-0.011>, <0.003,0.67,-0.011> rotate <0,0,i> texture {pigment {Black}}}   
    #declare i=i+6;
#end   
} 

cone{<0,0,-0.012>, 0.57, <0,0,1>, 0.57
    pigment {White*50}  } 
}
  
difference{  
union{
#declare i=0;
#while(i<360)    
    triangle {<0,0,-0.013>, <-0.009,0.68,-0.013>, <0.009,0.68,-0.013> rotate <0,0,i> texture {pigment {Black}}}   
    #declare i=i+30;
#end   
}

cone{<0,0,-0.114>, 0.54, <0,0,1>, 0.5
    pigment {White*50}  }  
}

//œróbka na œrodku
sphere {<0,0,0> 0.05
texture{pigment{Black}}

}

#declare Sec_Rot = -360*clock;
//wskazówki
//sekundowa
/*box{<-0.01, 0,-0.05>,<0.01,0.67, -0.05>  
rotate < 0,0,Sec_Rot>
} */
  
#declare Min_Rot = -6*clock;
//minutowa  
union{
cone{<0,0,-0.057>,0.015, <0,0.5,-0.057>, 0.015}
cone{<0,0.5,-0.057>,0.025, <0,0.55,-0.057>, 0}
pigment {Red}  
rotate<0,0,Min_Rot>
}  

#declare Hour_Rot = -0.5*clock;
//godzinowa
union{
cone{<0,0,-0.057>,0.022, <0,0.3,-0.057>, 0.022}
cone{<0,0.3,-0.057>, 0.03, <0,0.35,-0.057>, 0} 
pigment {Black}
rotate<0,0,Hour_Rot-60>  
}

//koniec tarczy 


//wahad³a
union{  
cylinder{<-0.25,-1,0.75>
         <-0.25,-3,0.75>
         0.025
         texture {pigment {White}}  }   
    

torus{
     0.12, 0.06   
     rotate<90,0,0>              
     scale<1,3,1>
     translate<-0.25,-3.3, 0.75>
     texture {pigment {White}}
} 

translate<0,0,0.2> 

}

union { 

torus{
     0.12, 0.06   
     rotate<90,0,0>              
     scale<1,3, 1>
     translate<0.25,-2.8, 0.75>
     texture {pigment {White}}
}    

cylinder{ <0.25, -1, 0.75>
          <0.25, -2.5, 0.75>  
          0.025
          texture {pigment {White}}
}  
translate<0,0,-0.2>
}

//koniec wahadla 
}
}
//----------------------------------------------------KONIEC ZEGAR    

//----------------------------------------------------SWIECA
#declare Candle=object{
union{  
//plomien
union{
intersection{
sphere{<0,0,0> 1
translate<-0.5,0,0>}  
sphere{<0,0,0> 1
translate<0.5,0,0>}
texture{pigment { rgbf <2,2,0,1.4>}}
scale<0.7,2,0.7>
translate<0,0.5,0>
no_shadow
}

//cialo swiecy
cylinder{<0,-5,0>
         <0,-1,0>
         1.3
         texture {pigment {White}}  }  
         
cylinder{<0,-0.5,0>
         <0,-1,0>
         0.05
         texture {pigment {Black}}  }  

translate<10, 2.7, 2> 
scale<0.3,0.3,0.3>
} 
translate<1.3,-0.3,0.3>
scale<0.7,0.7,0.7>            
}    
}
//---------------------------------------------KONIEC swiecy  
   
//---------------------------------------SUNNY WALL
#declare Sunny_Wall=object{
difference{
box {<11, -50,-2000> <11.5, 50 ,2000>
texture{pigment {Gray}}
}

union{  
//middle
box{<10,6,-9.5><12,12,-5.5>
}  
box{<10,6,-4.5><12,12,-0.5>
} 
box{<10,6,-10.5><12,12,-14.5>
}      
box{<10,6,-15.5><12,12,-19.5>
}
//down row
box{<10,-1,-4.5><12,5,-0.5>
} 
box{<10,-1,-9.5><12,5,-5.5>
}  
box{<10,-1,-10.5><12,5,-14.5>
} 
box{<10,-1,-15.5><12,5,-19.5>
}
//up row
box{<10,13,-4.5><12,19,-0.5>
} 
box{<10,13,-9.5><12,19,-5.5>
}  
box{<10,13,-10.5><12,19,-14.5>
} 
box{<10,13,-15.5><12,19,-19.5>
}
}
     
} 
}

//------------------------PICTURE
#declare Picture=object{ 
union{  
        difference{  
        object{Round_Box(<-0.5,-1,1>,<2,2.3,1.5>,0.25,0) 
        texture{ T_Wood12 } 
        }
        box{ <0,0,0.95>, <1,1,1.25>
        scale <722,1113,0>/500 
        translate<0.05,-0.45,0>
         } 
        }     
    box{ <0,0,1.1>, <1,1,1.1>
    pigment{
    image_map
        {png "klara.png"
            }    
        } 
        scale <722,1113,0>/500 
        translate<0.05,-0.45,0>
        finish {ambient 0.3}
         }             
    }   
    }                 
//-------------------------KONIEC PICTURE                      

//-------------------------Regal
#declare Regal=object{  
union{
union{
    object{Round_Box(<-4.5,-5.6,-1>,<-4, -1, 1.5>, 0.15, 0)}
    object{Round_Box(<1,-5.6,-1>,<1.5, -1, 1.5>, 0.15, 0)}
    object{Round_Box(<-4,-5.5,-0.9>,<1,-5,1.5>,0.15,0)} 
    object{Round_Box(<-4,-3,-0.9>,<1,-2.5,1.5>,0.15,0)}
    texture {T_Wood12} 
    }   
    //szuflada
    box{<-3.9,-4.9,-0.7>,<0.9,-3.1,1.5>
    texture{pigment {Gray*0.3}}} 
    union{
    sphere{<-3,-3,-1>, 0.2} 
    sphere{<-2,-3,-1>, 0.2}
    translate<1,-1,0> 
    texture{pigment {Brown*0.5}}
    } 
    //ksiazki
    object{Round_Box(<-4,-2.5,-0.7>,<-3.5,-0.2,1.5>,0.1,0)
    texture{pigment{Red*0.09}}}
    object{Round_Box(<-3.5,-2.5,-0.7>,<-3,-0.3,1.5>,0.1,0)
    texture{pigment{Blue*0.09}}}
    object{Round_Box(<-3,-2.5,-0.7>,<-2.5,-0.4,1.5>,0.1,0)
    texture{pigment{Yellow*0.09}}
    rotate<0,0,5>
    translate<0,0.25,0>}
    object{Round_Box(<-2.3,-2.5,-0.7>,<-2,-0.5,1.5>,0.1,0)
    texture{pigment{Green*0.09}}
    } 
    }
    }
//------------------------koniec regal
      


#declare House=object{
union{    
box {<-20,-8,-38>,<20,-8,2>
texture {T_Wood14}
}    
box{<-14,-20,1.5>,<12,20,1.5>
texture{pigment {Gray}}
}   
box {<-13, -20,-2000> <-13, 20 ,2000>
texture{pigment {Gray}}}  
box {<-14, 20,-2000> <12, 20 ,2000>
texture{pigment {Gray}}} 
}  
}



//rozmieszczanie obiektow
Day_Light
Candles_Light
union{
object {Clock scale<1.5,1.5,1.5>
translate<0,0,-0.6>} 
union{
object {Shelf}
object {Candle} 
translate<0.5,0,0>
}  
scale<1.5,1.5,1.5> 
translate<0,2,-0.6>
}
object{
Sunny_Wall translate<-2,0,-4>}   
object{Picture scale<1.4,1.4,1>
   translate<-9,3.5,0>  }
object{Regal scale<0.7,0.7,0>
translate<-4,0,0>
}
object{Candle translate<-7.25,-1,-1>} 
House

    
