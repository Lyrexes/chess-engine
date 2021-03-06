module Bitboard (showBitboard, orBB, sqrOf, rowOf, colOf) where

import Data.Word
import Data.Bits
import Types (PieceType, U64)

-----------------------------------------------------------------------------
-- converts bitboard to chess board string showBitboard :: Bitboard -> String
showBitboard :: Word64 -> String
showBitboard bb = concat [tileFrameToStr bb r c | r <-[0..7], c<- [0..8]]

tileFrameToStr :: Word64 -> Int -> Int -> String
tileFrameToStr bb row 0 = show (8-row)++ spaces 3 ++ tileToStr bb row 0
tileFrameToStr bb 7 8 = "\n\n" ++ spaces 4 ++ ['a'..'h'] ++ "\n"++ show bb
tileFrameToStr _ _ 8 = "\n"
tileFrameToStr bb row col = tileToStr bb row col

tileToStr :: Word64 -> Int -> Int -> String
tileToStr bb row col = if testBit bb (row*8+col) then "1" else "0"
-----------------------------------------------------------------------------

-------------------------------
-- returns string with i spaces
spaces :: Int -> String
spaces i = replicate i ' '
-------------------------------

----------------------------------
--Or an List of bitboards together
orBB :: [U64] -> U64
orBB = foldl (.|.) 0
----------------------------------

-----------------------------------------
--Row ,column and square helper functions
sqrOf :: Int -> Int -> Int
sqrOf row col = row * 8 + col

rowOf :: Int -> Int
rowOf square = div square 8

colOf :: Int -> Int
colOf square = mod square 8
-----------------------------------------
