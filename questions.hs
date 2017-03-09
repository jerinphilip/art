{-# LANGUAGE NoMonomorphismRestriction #-}
{-# LANGUAGE FlexibleContexts          #-}
{-# LANGUAGE TypeFamilies              #-}

import Diagrams.Prelude
import Diagrams.TwoD.Vector
import Diagrams.Backend.SVG.CmdLine

xs = 1:xs
ys = 1:(-1):ys

points = zip xs ys
example :: Diagram B
example = fromOffsets $ map r2 $ take 10 points

example2 = translate

main = mainWith example



