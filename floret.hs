
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine

import Data.Colour.Palette.BrewerSet


mkCoords :: Int -> [P2 Double]
mkCoords n = [ coord (fromIntegral i) | i <- [1..n]]
    where
        coord m = p2 $ fromPolar (sqrt m) (2.4 * m)
        fromPolar r t = (r * cos t , r * sin t)

floret :: Double -> Diagram B
floret r = circle 0.6 # lw none # fc (colors !! n)
    where
        n = floor (1.4 * sqrt r) `mod` 10
        colors = black : (reverse $ brewerSet YlOrBr 9)

sunflower :: Int -> Diagram B
sunflower n = frame 4 $ position $ zip (mkCoords n) (florets n)
    where
        florets m = [floret (sqrt (fromIntegral i)) | i <- [1..m]]

example :: Diagram B
example = sunflower 2000 # bg  black

main = mainWith example



