
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


u = r2 (1, 2)
v = 2 *^ (unitY # rotateBy (1/19))

p = project u v

drawV v = fromOffsets [v]



example = mconcat [   
            drawV p # lc green # lwG 0.03, -- projection.
            drawV u # lc blue, -- u vector
            drawV v # lc red, -- g vector
            -- Perpendicular.
            drawV (p ^-^ v) # translate v # dashingG [0.1, 0.1] 0
        ]

main = mainWith (example :: Diagram B)
        
        
