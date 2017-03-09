#!/usr/bin/bash

src=$1
ghc $src.hs
./$src -w 1000 -h 1000 -o ../build/$src.svg
eog ../build/$src.svg


