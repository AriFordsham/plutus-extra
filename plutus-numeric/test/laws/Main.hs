module Main (main) where

import PlutusTx.NatRatio (NatRatio)
import PlutusTx.Natural (Natural)
import Test.Tasty (adjustOption, defaultMain, testGroup)
import Test.Tasty.Plutus.Laws (
  dataLaws,
  jsonLaws,
  plutusEqLaws,
  plutusOrdLaws,
 )
import Test.Tasty.QuickCheck (QuickCheckTests)

main :: IO ()
main =
  defaultMain . adjustOption (max testMinimum) . testGroup "Laws" $
    [ jsonLaws @Natural
    , jsonLaws @NatRatio
    , dataLaws @Natural
    , dataLaws @NatRatio
    , plutusEqLaws @Natural
    , plutusEqLaws @NatRatio
    , plutusOrdLaws @Natural
    , plutusOrdLaws @NatRatio
    ]
  where
    testMinimum :: QuickCheckTests
    testMinimum = 10000
