

{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


u = r2 (18, 1)
v = r2 (1, 6)
upv = u ^+^ v


drawV v = fromOffsets [v]
example u v = mconcat [   
            drawV u # lc blue # lwG 0.2, -- u vector
            drawV v # lc red # lwG 0.2, -- v vector
            drawV upv # lc purple # lwG 0.2, -- addition

            -- Perpendicular.
            drawV u # lc blue # translate v # dashingG [1, 0.5] 0 # lwG 0.2,
            drawV v # lc red # translate u # dashingG [1, 0.5] 0 #lwG 0.2
        ]

main = mainWith (example u v # frame 1:: Diagram B)
        
        
