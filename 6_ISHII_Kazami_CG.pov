#include "colors.inc" 
#include "shapes.inc"
#include "woods.inc"
#include "metals.inc"
#include "stones.inc"
#include "textures.inc"
 
camera{
    location <20,20,-30>  
    look_at<2, 0, -1>
    angle 30
} 
 
light_source{ y*1000 
    color 3*White
    rotate <-60, 0, 30>   
}

object{
    Plane_XZ
    pigment{color Firebrick}     
}

box{
    <100, 0.01, 8>, <-100, -0.01, 8.5>
    pigment{color White}
}

box{
    <100, 0.01, -8>, <-100, -0.01, -8.5>
    pigment{color White}
}

box{
    <11, 0.01, 10>, <11.5, -0.01, -10>
    pigment{color White}
}

#declare r1 = seed(123);
#declare r2 = seed(0);
#declare r3 = seed(987);
#declare cnt = -50;
#while (cnt <= 50)
    object{
        superellipsoid{
            <0.7, 0.7>
            scale <0.05, 0.002, 0.05>
            translate <rand(r1)*cnt, 0.001*rand(r2), rand(r3)*cnt>
            pigment{color Scarlet}
        }
    } 
    object{
        superellipsoid{
            <0.7, 0.7>
            scale <0.05, 0.002, 0.05>
            translate <rand(r1)*cnt, 0.001*rand(r2), -rand(r3)*cnt>
            pigment{color Scarlet}
        }
    }
    #declare cnt = cnt + 0.002;
#end

#declare Side=
    superellipsoid{
        <0.4, 0.4>
        scale <8.2, 0.6, 0.07>
    }

#declare Smallside=
    superellipsoid{
        <0.4, 0.4>
        scale <0.9, 0.4, 0.05>
    }

#declare Stick=
    superellipsoid{
            <0.2, 0.2>
            scale <0.7, 0.07, 0.1>
            rotate z*50
            translate <-3.25, 1.1, -2.3>
        }

#declare Foot=
    union{
        difference{
            union{
                object{
                    superellipsoid{
                        <0.1, 0.1>
                        scale <1.8, 0.09, 1>
                        translate <-3, 0, -1.6>
                    }
                }
                object{
                    Smallside
                    translate <-3.7, 0, -2.2>
                }
                object{
                    Smallside
                    translate <-3.7, 0, -1.2>
                }
                object{
                    superellipsoid{
                        <0.2, 0.2>
                        scale <1.4, 0.1, 0.85>
                        rotate z*-60
                        translate <-2.3, 1, -1.6>
                        pigment {color Black}
                    }
                }
                object{
                    superellipsoid{
                        <0.2, 0.2>
                        scale <0.6, 0.1, 0.9>
                        rotate z*-50
                        translate <-1.5, 0.4, -1.65>
                        pigment {color Mica}
                    }
                }
                object{
                    superellipsoid{
                        <0.4, 0.4>
                        scale <1.7, 0.3, 0.05>
                        translate <-3.1, 0, -2.56>
                    }
                }
                object{
                    superellipsoid{
                        <0.4, 0.4>
                        scale <1.7, 0.3, 0.05>
                        translate <-3.1, 0, -0.76>
                    }
                }                
            }
            #declare m = 0;
            #while (m < 4)
                object{
                    superellipsoid{
                        <0.5, 0.5>
                        scale <0.08, 0.14, 0.8>
                        rotate z*-5
                        translate <-3.2-0.35*m, 0.3, -1.6>
                        }
                    }
                #declare m = m + 1;
            #end
        }
        object{
            superellipsoid{
                <1, 0.25>
                scale <0.1, 0.1, 0.7>
                translate <-4, 0.25, -1.6>
            }
        }
        object {
            Stick
        }
        object{
            Stick
            translate<0, 0, 0.8>
        }
    }    
 
union{
    difference{
        union{
            object{
                superellipsoid{
                    <0.25, 0.25>
                    scale <8.5, 0.05, 0.6>
                    translate <0, 0.04, 0>
                }
            }
            object{
                superellipsoid{
                    <0.25, 0.25>
                    scale <0.7, 0.05, 2.1>
                    translate <-8.2, 0, 0>
                }
            }
            object{
                Side
                translate<-0.8, 0.2, -0.54>
            }
            object{    
                Side
                translate <-0.8, 0.2, 0.54>
            }
            object{
                text{
                    ttf "timrom.ttf", 
                    "NISHI",
                    0.05, x*0.1
                    scale <0.6, 0.6, 0>
                    translate <-8.5, 0.1, -0.64>
                    pigment{color Black}
                }
            }
        }
        #declare n = -9;
        #while (n < 11)
            object{
                superellipsoid{
                    <0.25, 0.25>
                    scale <0.15, 0.3, 0.63>
                    rotate z*-5
                    translate <0.6*n, 0.6, 0>
                }
            }
            #declare n = n + 1;
        #end
    }
    object{
        superellipsoid{
            <0.3, 0.3>
            scale <0.41, 0.35, 0.1>
            translate <2.35, 0.66, 0.55>
        }
    }
    object{
        Foot
    }
    object{
        Foot
        translate <5, 0, 3.15>
    }
    texture {finish{Dull} pigment {Gray30}}
}
