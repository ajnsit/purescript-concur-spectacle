module Concur.Spectacle.CodeSlide where

import Concur.React (el')
import Concur.React.DOM (El)
import React (Children, ReactClass, ReactElement, createElement)
import React.DOM.Props (unsafeFromPropsArray)
import React.DOM.Props as R

type ForeignReactComponent = ReactClass { children :: Children }

foreign import _codeSlideComponent :: ForeignReactComponent

_codeSlide :: Array R.Props -> Array ReactElement -> ReactElement
_codeSlide props children = createElement _codeSlideComponent (unsafeFromPropsArray props :: {}) children

codeSlide :: El
codeSlide = el' _codeSlide
