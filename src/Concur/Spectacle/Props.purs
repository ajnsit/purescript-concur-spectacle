module Concur.Spectacle.Props where

-- import Data.Foreign (Foreign)
import Data.Newtype (unwrap)
import Data.Time.Duration (Milliseconds)
import Prelude (map, (<<<))

import Concur.React.Props

-- | Spectacle attributes
type Theme =
  { colors ::
    { primary :: String
    , secondary  :: String
    , tertiary  :: String
    , quartenary  :: String
    }
  , fonts ::
    { primary :: String
    , secondary  :: String
    , tertiary  :: String
    }
  }

data ThemeObj

theme :: forall a. Theme -> ReactProps a
theme = unsafeMkProp "theme" <<< createTheme

foreign import createTheme :: Theme -> ThemeObj

-- | Deck attributes
data Progress
  = Pacman
  | Bar
  | Number
  | None

progress :: forall a. Progress -> ReactProps a
progress = unsafeMkProp "progress" <<< toString
  where
    toString Pacman = "pacman"
    toString Bar = "bar"
    toString Number = "number"
    toString None = "none"

preload :: forall a b. {| b } -> ReactProps a
preload = unsafeMkProp "preload"

-- | Base attributes
data Transition
  = Slide
  | Zoom
  | Fade
  | Spin

transition :: forall a. Array Transition -> ReactProps a
transition = unsafeMkProp "transition" <<< map toString
  where
    toString Slide = "slide"
    toString Zoom = "zoom"
    toString Fade = "fade"
    toString Spin = "spin"

transitionDuration :: forall a. Milliseconds -> ReactProps a
transitionDuration = unsafeMkProp "transitionDuration" <<< unwrap

showControls :: forall a. ReactProps a
showControls = unsafeMkProp "controls" true

italic :: forall a. ReactProps a
italic = unsafeMkProp "italic" true

bold :: forall a. ReactProps a
bold = unsafeMkProp "bold" true

caps :: forall a. ReactProps a
caps = unsafeMkProp "caps" true

margin :: forall a. String -> ReactProps a
margin = unsafeMkProp "margin"

padding :: forall a. String -> ReactProps a
padding = unsafeMkProp "padding"

textColor :: forall a. String -> ReactProps a
textColor = unsafeMkProp "textColor"

textSize :: forall a. String -> ReactProps a
textSize = unsafeMkProp "textSize"

textAlign :: forall a. String -> ReactProps a
textAlign = unsafeMkProp "textAlign"

textFont :: forall a. String -> ReactProps a
textFont = unsafeMkProp "textFont"

bgColor :: forall a. String -> ReactProps a
bgColor = unsafeMkProp "bgColor"

bgImage :: forall a. String -> ReactProps a
bgImage = unsafeMkProp "bgImage"

bgDarken :: forall a. Number -> ReactProps a
bgDarken = unsafeMkProp "bgDarken"

-- | Slide attributes
align :: forall a. String -> ReactProps a
align = unsafeMkProp "align"

notes :: forall a. String -> ReactProps a
notes = unsafeMkProp "notes"

id :: forall a. String -> ReactProps a
id = unsafeMkProp "id"

-- | Code-like attributes
source :: forall a. String -> ReactProps a
source = unsafeMkProp "source"

-- | CodePane attributes
lang :: forall a. String -> ReactProps a
lang = unsafeMkProp "lang"

-- | Text-like attributes
fit :: forall a. ReactProps a
fit = unsafeMkProp "fit" true

lineHeight :: forall a. String -> ReactProps a
lineHeight = unsafeMkProp "lineHeight"

-- | Image attributes
src :: forall a. String -> ReactProps a
src = unsafeMkProp "src"

display :: forall a. String -> ReactProps a
display = unsafeMkProp "display"

height :: forall a. String -> ReactProps a
height = unsafeMkProp "height"

width :: forall a. String -> ReactProps a
width = unsafeMkProp "width"

-- | Link attributes
href :: forall a. String -> ReactProps a
href = unsafeMkProp "href"

-- | S (text style) attributes
data TextStyle
 = Strikethrough
 | Underline
 | Bold
 | Italic

textStyle :: forall a. TextStyle -> ReactProps a
textStyle = unsafeMkProp "style" <<< toString
  where
    toString Strikethrough = "strikethrough"
    toString Underline = "underline"
    toString Bold = "bold"
    toString Italic = "italic"
