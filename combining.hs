{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine

--example = square 1 # fc aqua `atop` circle 1

diagrams = [square 1 # fc aqua, circle 1 # fc green , circle 3 # fc red]
-- example =  mconcat diagrams
example = foldl1 (|||) diagrams
main = mainWith (example :: Diagram B)

