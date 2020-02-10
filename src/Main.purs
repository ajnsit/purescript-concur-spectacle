module Main where

import Prelude hiding (div)

import Colors (blue, red, stormy, white, darkBg)
import Components (link)
import Concur.Core (Widget)
import Concur.Core.Types (display)
import Concur.React (HTML, renderComponent)
import Concur.React.DOM (div)
import Concur.React.DOM as D
import Concur.React.Props (ReactProps)
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Concur.Spectacle (codePane, deck, heading, slide)
import Concur.Spectacle.CodeSlide (codeSlide)
import Concur.Spectacle.CodeSlide.Props (RangeOptions, code, ranges)
import Concur.Spectacle.Props (Progress(..), Transition(..), bgColor, lang, preload, progress, textColor, theme, transition, transitionDuration)
import Data.Array (concat)
import Data.Time.Duration (Milliseconds(Milliseconds))
import Effect (Effect)
import Examples.Buttons (button2Ranges, button2Src, button2Wid, button3Ranges, button3Src, button3Wid, button4Ranges, button4Src, button4Wid, button5Ranges, button5Src, button5Wid, buttonRanges, buttonSrc, buttonWid, button6Ranges, button6Src, button6Wid, button7Ranges, button7Src, button7Wid, button8Ranges, button8Src, button8Wid)
import Examples.Todos (todosRanges, todosSrc, todosWid)

main :: Effect Unit
main = runWidgetInDom "root" do
    deck [ slideTheme
         , preload assets
         , progress Pacman
         , transition [ Zoom, Slide ]
         , transitionDuration (Milliseconds 1000.0)
         ] slides

assets :: {}
assets = {}

h :: forall a. Int -> String -> Widget HTML a
h size txt = heading [P.style {"fontWeight": "lighter"}, P.size size, textColor white] [D.text txt]

codeHeading :: forall a. String -> Widget HTML a
codeHeading title = heading [ P.style { "position": "fixed"
                                      , "left": "50%"
                                      , "top": "-120px"
                                      , "transform": "translate(-50%)"
                                      , "padding": "20px 40px"
                                      , "border": "10px solid hotpink"
                                      , "font-size": "2.5em"
                                      , "color": "white"
                                      , "white-space": "nowrap"
                                      }
                            , P.size 1
                            ] [D.text title]

codePaneSlide :: forall a. String -> Array RangeOptions -> Widget HTML a
codePaneSlide src rangeArray =
  codeSlide
    [ P.style { "fontSize": "1rem" }
    , transition []
    , lang "haskell"
    , code src
    , ranges rangeArray
    ] []

codePane' :: forall a. String -> Widget HTML a
codePane' src =
  codePane
    [ P.style { "fontSize": "1.4rem" }
    , lang "haskell"
    , code src
    ] []


widgetSlides :: forall a b. String -> String -> (String -> Array RangeOptions) -> Widget HTML a -> Array (Widget HTML b)
widgetSlides title src r w =
  [ slide [bgColor darkBg]
      [ codeHeading title
      , div [P.style {"zoom": "2.0"}] [disassociate w]
      ]
  , codePaneSlide src (r title)
  ]

-- Spectacle has issues with wrapping everything inside one big component
-- So we have to create separate components for each Concur Widget
disassociate :: forall a b. Widget HTML a -> Widget HTML b
disassociate w = display [renderComponent w]

slides :: forall a. Array (Widget HTML a)
slides =
  [ slide [bgColor red] [ h 1 "Concur", h 5 "scalable functional UIs" ]
  , slide [bgColor blue] [ h 3 "Scalable?" ]
  ] <> concat
    [ widgetSlides "Hello Sailor!" buttonSrc buttonRanges buttonWid
    , widgetSlides "Todos" todosSrc todosRanges todosWid
    ] <>
  [ slide [bgColor blue] [ h 3 "Functional?" ]
  , slide [bgColor blue] [ h 3 "DSL for Functional Views" ]
  ] <> concat
    [ widgetSlides "Composing Widgets" button2Src button2Ranges button2Wid
    , widgetSlides "Composing Widgets" button3Src button3Ranges button3Wid
    ] <>
  [ slide [bgColor blue] [ h 3 "Monadic Event Handling" ]
  ] <> concat
    [ widgetSlides "Event Handling" button4Src button4Ranges button4Wid
    , widgetSlides "Nested Event Handling" button5Src button5Ranges button5Wid
    , widgetSlides "Concurrent Event Handling" button6Src button6Ranges button6Wid
    , widgetSlides "Handling Multiple Events" button7Src button7Ranges button7Wid
    , widgetSlides "Elm Architecture" button8Src button8Ranges button8Wid
    ] <>
  [ slide [] [link "http://github.com/ajnsit/purescript-concur" "Go to Concur Purescript repository page"]
  ]

-- Theming
slideTheme :: forall a. ReactProps a
slideTheme = theme
  { colors:
    { primary: stormy
    , secondary: stormy
    , tertiary: blue
    , quartenary: stormy
    }
  , fonts:
    { primary: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif"
    , secondary: "-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica Neue,sans-serif"
    , tertiary: "Ahamono,Menlo,monospace"
    }
  }
