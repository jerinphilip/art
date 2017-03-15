
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


yellowC = circle 0.5 # fc yellow
purpleC = circle 0.5 # fc purple

figure x y r
    | x*x + y*y <= r*r  = yellowC
    | otherwise = purpleC


gridPoints hw = [(x, y) | x <- pts, y <-pts ]
    where 
        pts = [(-hw), ((-hw)+1)..hw]

dots hw = atPoints (map p2 pts) figures
    where
        figures = map (\(x, y)-> figure x y hw) pts
        pts = (gridPoints hw)


main = mainWith ((dots 30)::Diagram B)


    

