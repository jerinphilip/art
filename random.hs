{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


import System.Random (randomRIO)
import Control.Monad (replicateM)

c :: Diagram B
c = circle 5 # scaleX 2 # rotateBy (1/14)

mkPoint p = (p, circle 0.3 
                # lw none 
                # fc (case inquire c p of
                True -> red
                False -> blue))

rand10 :: IO Double
rand10 = randomRIO (-10, 10)

example = do
    points <- replicateM 20 (mkP2 <$> rand10 <*> rand10)
    return $ c <> position (map mkPoint points)

main = mainWith example

