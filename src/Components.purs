module Components where

import Colors (blue)
import Concur.Core (Widget)
import Concur.React (HTML)
import Concur.React.DOM as D
import Concur.React.Props as P
import Concur.Spectacle as S

link :: forall a. String -> String -> Widget HTML a
link t s = S.link [P.style {"foregroundColor": blue}, P.target "_blank", P.href t] [D.text s]
