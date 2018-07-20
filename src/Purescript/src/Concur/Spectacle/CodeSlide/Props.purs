module Concur.Spectacle.CodeSlide.Props where

import Concur.React.Props (Props, unsafeMkProp)

code :: forall a. String -> Props a
code = unsafeMkProp "code"

type RangeOptions =
  { "title" :: String
  , "note" :: String
  -- , "image" :: String
  , "loc" :: Array Int
  }

ranges :: forall a. Array RangeOptions -> Props a
ranges = unsafeMkProp "ranges"
