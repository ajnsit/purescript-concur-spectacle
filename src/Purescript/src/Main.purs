module Main where

import Prelude

import Colors (blue, red, stormy, white)
import Components (link)
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props (Props)
import Concur.React.Props as P
import Concur.React.Run (runWidgetInDom)
import Concur.Spectacle (deck, heading, slide)
import Concur.Spectacle.CodeSlide (codeSlide)
import Concur.Spectacle.CodeSlide.Props (code, ranges)
import Concur.Spectacle.Props (Progress(Bar), Transition(..), bgColor, notes, preload, progress, textColor, theme, transition, transitionDuration)
import Data.Time.Duration (Milliseconds(Milliseconds))
import Effect (Effect)
import Examples.Hello (helloSrc)

main :: Effect Unit
main = runWidgetInDom "root" do
    deck [ slideTheme
         , preload assets
         , progress Bar
         , transition [ Zoom, Slide ]
         , transitionDuration (Milliseconds 1000.0)
         ] slides

assets :: {}
assets = {}

heading' :: forall a. String -> Widget HTML a
heading' txt = heading [P.style {"fontWeight": "lighter"}, P.size 3, textColor white] [D.text txt]

sectionTitleSlide :: forall a. String -> String -> Widget HTML a
sectionTitleSlide color titleTxt = slide [bgColor color] [ heading' titleTxt ]

slides :: forall a. Array (Widget HTML a)
slides =
  [ sectionTitleSlide red "Concur - Functional UIs"
  , codeSlide
        [ P.style { "fontSize": "1rem" }
        , transition []
        , P.lang "haskell"
        , code helloSrc
        , ranges
          [ { "loc": [0, 159]
            , "title": "Hello World"
            , "note": ""
            , "image": ""
            }
          ]
        ] []
  , slide [] [link "http://github.com/ajnsit/purescript-concur" "Go to Concur Purescript repository page"]
  ]

-- Theming
slideTheme :: forall a. Props a
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
