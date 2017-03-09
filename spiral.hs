{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine

example :: Diagram B
example = lwG 0.05 . mconcat . map fromOffsets 
            $ [[ r *^ e (r @@ rad)] | r <- [ 33 * tau/32, 34 * tau/32 .. 2*tau]]

main = mainWith example


