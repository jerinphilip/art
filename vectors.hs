

{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


example :: Diagram B
example = fromOffsets [unitY, 2 *^ unitX, -1 *^ unitY, -1 *^ unitX] # centerXY

exampleR2 :: Diagram B
exampleR2 = fromOffsets . map r2 $ [(1, 1), (0, 3), (-2, 1), (-1, -4)]


main = mainWith exampleR2



