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

theme :: forall a. Theme -> Props a
theme = unsafeMkProp "theme" <<< createTheme

foreign import createTheme :: Theme -> ThemeObj

-- | Deck attributes
data Progress
  = Pacman
  | Bar
  | Number
  | None

progress :: forall a. Progress -> Props a
progress = unsafeMkProp "progress" <<< toString
  where
    toString Pacman = "pacman"
    toString Bar = "bar"
    toString Number = "number"
    toString None = "none"

preload :: forall a b. {| b } -> Props a
preload = unsafeMkProp "preload"

-- | Base attributes
data Transition
  = Slide
  | Zoom
  | Fade
  | Spin

transition :: forall a. Array Transition -> Props a
transition = unsafeMkProp "transition" <<< map toString
  where
    toString Slide = "slide"
    toString Zoom = "zoom"
    toString Fade = "fade"
    toString Spin = "spin"

transitionDuration :: forall a. Milliseconds -> Props a
transitionDuration = unsafeMkProp "transitionDuration" <<< unwrap

showControls :: forall a. Props a
showControls = unsafeMkProp "controls" true

italic :: forall a. Props a
italic = unsafeMkProp "italic" true

bold :: forall a. Props a
bold = unsafeMkProp "bold" true

caps :: forall a. Props a
caps = unsafeMkProp "caps" true

margin :: forall a. String -> Props a
margin = unsafeMkProp "margin"

padding :: forall a. String -> Props a
padding	= unsafeMkProp "padding"

textColor :: forall a. String -> Props a
textColor = unsafeMkProp "textColor"

textSize :: forall a. String -> Props a
textSize = unsafeMkProp "textSize"

textAlign	:: forall a. String -> Props a
textAlign	= unsafeMkProp "textAlign"

textFont :: forall a. String -> Props a
textFont = unsafeMkProp "textFont"

bgColor :: forall a. String -> Props a
bgColor = unsafeMkProp "bgColor"

bgImage :: forall a. String -> Props a
bgImage = unsafeMkProp "bgImage"

bgDarken :: forall a. Number -> Props a
bgDarken = unsafeMkProp "bgDarken"

-- | Slide attributes
align :: forall a. String -> Props a
align = unsafeMkProp "align"

notes :: forall a. String -> Props a
notes = unsafeMkProp "notes"

id :: forall a. String -> Props a
id = unsafeMkProp "id"

-- | Code-like attributes
source :: forall a. String -> Props a
source = unsafeMkProp "source"

-- | CodePane attributes
lang :: forall a. String -> Props a
lang = unsafeMkProp "lang"

-- | Text-like attributes
fit :: forall a. Props a
fit = unsafeMkProp "fit" true

lineHeight :: forall a. String -> Props a
lineHeight = unsafeMkProp "lineHeight"

-- | Image attributes
src :: forall a. String -> Props a
src = unsafeMkProp "src"

display :: forall a. String -> Props a
display = unsafeMkProp "display"

height :: forall a. String -> Props a
height = unsafeMkProp "height"

width :: forall a. String -> Props a
width = unsafeMkProp "width"

-- | Link attributes
href :: forall a. String -> Props a
href = unsafeMkProp "href"

-- | S (text style) attributes
data TextStyle
 = Strikethrough
 | Underline
 | Bold
 | Italic

textStyle :: forall a. TextStyle -> Props a
textStyle = unsafeMkProp "style" <<< toString
  where
    toString Strikethrough = "strikethrough"
    toString Underline = "underline"
    toString Bold = "bold"
    toString Italic = "italic"
