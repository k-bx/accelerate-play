{-# LANGUAGE OverloadedLists #-}

module Main where

import Data.Array.Accelerate as A
import Data.Array.Accelerate.LLVM.Native as CPU
import Data.Array.Accelerate.LLVM.PTX as GPU

dotp :: Acc (Vector Float) -> Acc (Vector Float) -> Acc (Scalar Float)
dotp xs ys = A.fold (+) 0 (A.zipWith (*) xs ys)

main :: IO ()
main = do
  putStrLn "hey"
  print (GPU.run (dotp (use []) (use [])))
