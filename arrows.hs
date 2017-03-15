
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


sPt :: P2 Double
sPt = p2 (0.20, 0.20)
ePt :: P2 Double
ePt = p2 (2.85, 0.85)

spot :: Diagram B
spot = circle 0.02 # lw none
sDot :: Diagram B
sDot = spot # fc blue # moveTo sPt
eDot :: Diagram B
eDot = spot # fc red # moveTo ePt


example = (    sDot <> eDot <> arrowBetween' (with & headLength .~ veryLarge) sPt ePt) # centerXY # pad 1.1

main = mainWith (example :: Diagram B)
