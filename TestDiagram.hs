
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

c :: Diagram B
c = circle 1 # fc blue
d = circle 2 # fc red
h = square 4 # fc black
e = (c === d)
f = (e ||| h)

others = vcat (map circle [1..10])
final :: Diagram B
final = hcat (replicate 3 others)

main = mainWith f
