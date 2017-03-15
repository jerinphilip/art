
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


innerR = 3
outerR = 10 * innerR


innerDisc = circle innerR # fc red # lw none
outerDisc = circle outerR # fc yellow


getPoints r n = [(r*cos t, r*sin t) | t <- [0, 2*pi/(n-1) .. 2*pi]]

eps = 0.01
innerPoints = map p2 $ getPoints (innerR + eps) 16
outerPoints = map p2 $ getPoints (outerR - eps) 16

mkArrow (start, end) = arrowBetween' 
                        (with 
                            & arrowHead .~ thorn
                            & arrowTail .~ thorn'
                            & arrowShaft .~ (arc xDir (1/6 @@ turn))
                            & lengths .~ large) start end

arrows = map mkArrow $ zip innerPoints outerPoints



dg :: Diagram B
dg = innerDisc <> mconcat arrows <> outerDisc  # frame 2 # bg white


main = mainWith dg

