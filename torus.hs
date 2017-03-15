{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


innerR = 3
outerR = 10 * innerR


innerDisc = circle innerR # fc red # lw none # named "inner"
outerDisc = circle outerR # fc yellow # named "outer"


arrowStyle = (with 
                & arrowHead .~ thorn
                & arrowTail .~ thorn'
                & arrowShaft .~ (arc xDir (1/6 @@ turn))
                & lengths .~ large)

basic :: Diagram B
basic = innerDisc <> outerDisc

turns = [x/15 | x<-[0..15]]
dg = zipWith connectPerim' 

main = mainWith dg

