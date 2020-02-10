module Concur.Spectacle.CodeSlide.Props where

import Concur.React.Props (ReactProps, unsafeMkProp)


code :: forall a. String -> ReactProps a
code = unsafeMkProp "code"

type RangeOptions =
  { "title" :: String
  , "note" :: String
  -- , "image" :: String
  , "loc" :: Array Int
  }

ranges :: forall a. Array RangeOptions -> ReactProps a
ranges = unsafeMkProp "ranges"
