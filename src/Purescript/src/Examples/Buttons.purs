module Examples.Buttons where

import Prelude

import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM (button, button', div', text, input, h5')
import Concur.React.Props (onClick, _type, value, onChange, checked, defaultValue)
import Concur.Spectacle.CodeSlide.Props (RangeOptions)
import Unsafe.Coerce (unsafeCoerce)

buttonRanges :: String -> Array RangeOptions
buttonRanges title =
  [ { "loc": [0, 1]
    , "title": title
    , "note": ""
    }
  ]

buttonSrc :: String
buttonSrc = """button' [text "Hello Sailor!"]"""

buttonWid :: forall a. Widget HTML a
buttonWid = button' [text "Hello Sailor!"]

button2Ranges :: String -> Array RangeOptions
button2Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button2Src :: String
button2Src = """div'
  [ button' [text "Ahoy Port!"]
  , button' [text "Ahoy Starboard!"]
  ]"""

button2Wid :: forall a. Widget HTML a
button2Wid = div'
  [ button' [text "Ahoy Port!"]
  , button' [text "Ahoy Starboard!"]
  ]


button3Ranges :: String -> Array RangeOptions
button3Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button3Src :: String
button3Src = """div'
  [ div'
      [ button' [text "Ahoy Port!"] ]
  , div'
      [ button' [text "Ahoy Starboard!"] ]
  ]"""

button3Wid :: forall a. Widget HTML a
button3Wid = div'
  [ div'
      [ button' [text "Ahoy Port!"] ]
  , div'
      [ button' [text "Ahoy Starboard!"] ]
  ]

button4Ranges :: String -> Array RangeOptions
button4Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button4Src :: String
button4Src = """do
  button [onClick] [text "Say Hello"]
  text "Hello Sailor!" """

button4Wid :: forall a. Widget HTML a
button4Wid = do
  _ <- button [onClick] [text "Say Hello"]
  text "Hello Sailor!"

button5Ranges :: String -> Array RangeOptions
button5Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button5Src :: String
button5Src = """forever do
  button [onClick] [text "Say Hello"]
  div' [text "Hello Sailor!", button [onClick] [text "Restart"]]"""

button5Wid :: forall a. Widget HTML a
button5Wid = do
  _ <- button [onClick] [text "Say Hello"]
  _ <- div' [text "Hello Sailor!", button [onClick] [text "Restart"]]
  button5Wid

button6Ranges :: String -> Array RangeOptions
button6Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button6Src :: String
button6Src = """do
  greeting <- div'
    [ "Hello" <$ button [onClick] [text "Say Hello"]
    , "Namaste" <$ button [onClick] [text "Say Namaste"]
    ]
  text (greeting <> " Sailor!")"""

button6Wid :: forall a. Widget HTML a
button6Wid = do
  greeting <- div'
    [ "Hello" <$ button [onClick] [text "Say Hello"]
    , "Namaste" <$ button [onClick] [text "Say Namaste"]
    ]
  text (greeting <> " Sailor!")

button7Ranges :: String -> Array RangeOptions
button7Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button7Src :: String
button7Src = """forever do
  button [onClick] [text "Say Hello"]
  div' [text "Hello Sailor!", button [onClick] [text "Restart"]]"""

button7Wid :: forall a. Widget HTML a
button7Wid = do
  _ <- button [onClick] [text "Say Hello"]
  _ <- div' [text "Hello Sailor!", button [onClick] [text "Restart"]]
  button5Wid

button8Ranges :: String -> Array RangeOptions
button8Ranges title =
  [ { "loc": [0, 100]
    , "title": title
    , "note": ""
    }
  ]

button8Src :: String
button8Src = """-- This is like Elm's State
type Form =
  { name :: String
  , rememberMe :: Boolean
  }

-- This is like Elm's Action
data FormAction
  = Name String
  | RememberMe Boolean
  | Submit

formWidget form = do
  -- This is like Elm's view function
  res <- div'
    [ div' [Name <$> input [_type "text", value form.name, onChange]]
    , div'
      [ text "Remember Me"
      , RememberMe <$> input [_type "checkbox", checked form.rememberMe, onChange]
      ]
    , div' [Submit <$ button [onClick] [text "Submit"]]
    ]
  -- This is like Elm's update function
  case res of
    Name s -> formWidget (form {name = s})
    RememberMe b -> formWidget (form {rememberMe = b})
    Submit -> pure form"""

-- This is like Elm's State
type Form =
  { name :: String
  , rememberMe :: Boolean
  }

-- This is like Elm's Action
data FormAction
  = Name String
  | RememberMe Boolean
  | Submit

button8Wid :: forall a. Widget HTML a
button8Wid = go {"name": "Michael", "rememberMe": true}
  where
    go form = do
      form' <- div' [ text ("Name: " <> form.name <> ", RememberMe: " <> show form.rememberMe)
                    , formWidget form]
      go form'

formWidget :: Form -> Widget HTML Form
formWidget form = do
  -- This is like Elm's view function
  res <- div'
    [ h5' [text "Login form"]
    , div' [Name <$> input [defaultValue form.name, x]]
    , div' [ text "Remember Me "
           , RememberMe (not form.rememberMe) <$ input [_type "checkbox", checked form.rememberMe, onChange]
           ]
    , div' [Submit <$ button [onClick] [text "Submit"]]
    ]

  -- This is like Elm's update function
  case res of
    Name s -> formWidget (form {name = s})
    RememberMe b -> formWidget (form {rememberMe = b})
    Submit -> pure form
  where
    x = targetValue <$> onChange
    targetValue e = (unsafeCoerce e).target.value
