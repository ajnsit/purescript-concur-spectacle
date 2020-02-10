module Examples.Hello where

helloSrc :: String
helloSrc = """helloWidget :: Widget HTML Int
helloWidget = snd <$> runStateT helloWidgetS 0

helloWidgetS :: forall a. StateT Int (Widget HTML) a
helloWidgetS = do
  count <- get
  e <- lift $ div'
    [ but "Say Hello!"
    , but $ "For the " <> show count <> " time, hello sailor!"
    ]
  put (count + 1)
  liftEffect (log "You said Hello!")
  helloWidgetS
  where
    but s = button [onClick] [text s]"""
