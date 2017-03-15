
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine

a = 6
b = 8
c = sqrt $ a^2 + b^2

absq = square (a+b) # fc green # lw none
eps = 0.6
pts = map p2 [(c/2-eps, 0), (0, c/2-eps), (0, -c/2+eps), (-c/2+eps, 0)]
labelsCsq = atPoints pts (repeat (text "c"))
rawCsq = square c # lw none # fc yellow
csq = (labelsCsq <> rawCsq ) # rotate ((atan2 a b) @@ rad)

aPts = map p2 [(v, u), (-u, v), (-v, -u), (u, -v)]
    where 
        v = (-hw + a/2)
        u = (hw + eps)
        hw  = (a+b)/2

bPts = map p2 [(v, u), (-u, v), (-v, -u), (u, -v)]
    where 
        v = (-hw + (2*a+b)/2)
        u = (hw + eps)
        hw  = (a+b)/2

labelsA = atPoints aPts (repeat (text "a"))
labelsB = atPoints bPts (repeat (text "b"))


composedDiagram = csq <> absq <> labelsA <> labelsB

final = composedDiagram # frame 3 # bg white


cTriangle b h = strokeLoop . fromVertices $ map p2 (pts ++ [head pts])  
    where
        pts = [(-b/2, -h/2), (b/2, h/2), (b/2, -h/2)]


abT = (cTriangle b a) # fc green # lw none

explanation = hsep 2 [lhs, text "=", rhs] # frame 2 # bg white
    where 
        lhs = (rawCsq # rotate ((atan2 a b) @@ rad)) <> absq
        rhs = hsep 2 [rawCsq, (text "+"), fourAbT]
        fourAbT = vsep 1 (replicate 2 (hsep 1 (replicate 2 abT)))

textExplanation = vsep 2 [
                    text "(a+b)^2 = c^2 + 4 * 0.5 * ab",
                    text "(a+b)^2 - 2*ab = c^2 ",
                    text "a^2 + b^2 = c^2 "
                ]

complete = vsep 2 [final, explanation] # frame 2 # bg white

main = mainWith (complete :: Diagram B)
