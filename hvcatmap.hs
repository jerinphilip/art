

{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine


others = vcat (map circle [1..10])
final :: Diagram B
final = hcat (replicate 3 others)

main = mainWith final 
