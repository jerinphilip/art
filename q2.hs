
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


origins = map p2 vs
    where
        vs = [(r*cos(t), r*sin(t)) | t <- angles]
        angles = [-pi/2, -pi/2+d.. pi/2]
        d = pi/5
        r = 1.0

example :: Diagram B
example = atPoints origins (repeat (circle 0.2 # fc green)) 

main = mainWith example 
