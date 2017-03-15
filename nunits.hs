{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


theSq = square 1 # lwN 0.01
example = hsep 0.2 (map (\s -> theSq # scale s) [0.5, 0.7..1.5]) # scale 20

main = mainWith (example :: Diagram B)
