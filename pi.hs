
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine
import qualified Diagrams.Color.XKCD as XC

g = 10
w = 10
h = 15
sval = 3

u = sqrt (g*(w^2)/(h+w))
dPi = text "π" # italic # fc red # scale sval # moveTo (p2 (w, 0))
dTau = text "τ" # italic # fc green # scale (2*sval) # moveTo (p2 (0, h))

y u t x = x*(tan t) - g*(x^2)/(2*(u*cos t)^2)
y' = y u (pi/4)


pts = map p2 $ zip xs ys
    where
        xs = drop 2 $ take (count-1) [0, w/(count-1)..w]
        ys = map ((h+). y') xs
        count = 20

dDrop = circle 0.2 # fcA XC.goldenYellow # lw none
drops = atPoints pts (repeat dDrop)
base = rect w' h' # fcA XC.rawUmber # lw none # moveTo (p2 ((w'-d)/2, -h'/2))
    where
        w' = w + 2*d
        h' = h/4
        d = 1

caption = text "Happy pi day!" # scale 2 # bold # moveTo (p2 (w/2, -2*h/8))
subcaption = text "3.14" # fc brown # moveTo (p2 (w/2, -3*h/8)) 

final = (dPi <> dTau <> drops <> caption <> subcaption)
padded = final # frame 4 # bg white
main = mainWith (padded :: Diagram B)


