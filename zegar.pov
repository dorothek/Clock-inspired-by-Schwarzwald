//Zegar    
#include "colors.inc"  
#include "woods.inc"  
#include "shapes.inc"


background{White}    
camera{location<0,0,-4> look_at<1,0,0>}
light_source { <1000,1000,-1000>, White}  
 
//-----------------------------------------PӣKA
#declare Pulka= object{
//p�ka
box{<2,-1,0>,<4,-0.7, 1.5>
texture {pigment {Brown*3}}
}
}
//----------------------------------------Koniec p�ki

#declare Zegar= object{
//pud�o zegara
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

//koniec pud�a  
 
//tarcza zegara
cone{<0,0,-0.01>, 0.73, <0,0,1>, 0.73
    pigment {White*50}  }  

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

//�r�bka na �rodku
sphere {<0,0,0> 0.05
texture{pigment{Black}}

}

//wskaz�wki
//sekundowa
box{<-0.01, 0,-0.12>,<0.01,0.67, -0.12> 
rotate<0,0,-15>
}

//minutowa  
union{
cone{<0,0,-0.125>,0.015, <0,0.5,-0.125>, 0.015}
cone{<0,0.5,-0.125>,0.025, <0,0.55,-0.125>, 0}
pigment {Red}  
rotate<0,0,36>
}  

//godzinowa
union{
cone{<0,0,-0.125>,0.022, <0,0.3,-0.125>, 0.022}
cone{<0,0.3,-0.125>, 0.03, <0,0.35,-0.125>, 0} 
pigment {Black}
rotate<0,0,-90>  
}

//koniec tarczy 


//wahad�a
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

//koniec wahad�a 
}
}
//----------------------------------------------------KONIEC ZEGAR    

//----------------------------------------------------SWIECA
#declare Swieca=object{
union{  
//p�omie�
union{
intersection{
sphere{<0,0,0> 1
translate<-0.5,0,0>}  
sphere{<0,0,0> 1
translate<0.5,0,0>}
texture{pigment { rgbf <2,2,0,.8>}}
scale<0.7,2,0.7>
translate<0,0.5,0>
}

//cia�o �wiecy
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
//-------------------------------------------------KONIEC �wiecy  


plane {
y,
-10
texture {pigment {Red}}
} 

plane {
z,
1.5
texture{pigment {Gray}}
}   

/*plane {
x,
10
texture{pigment {Gray}}
} */ 


//rozmieszczanie obiekt�w 

Zegar
Pulka  
Swieca
