


{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine


example :: Diagram B
example = hrule (2 * sum sizes ) === circles # centerX
    where 
        circles = hcat . map alignT $ zipWith fc colors $ zipWith scale sizes 
                  $ repeat (circle 1)
        ls = [3..6]
        sizes = ls ++ [7] ++ (reverse ls)
        colors = [violet, yellow, indigo, green, orange, blue, red]

main = mainWith example
        
