module Concur.Spectacle where

import Concur.React (el')
import Concur.React.DOM (El)
import React (ReactElement, ReactClass, Children, createElement)
import React.DOM.Props (Props) as R
import React.DOM.Props (unsafeFromPropsArray)

type ForeignReactComponent = ReactClass { children :: Children }

foreign import _deckComponent :: ForeignReactComponent

_deck :: Array R.Props -> Array ReactElement -> ReactElement
_deck props children = createElement _deckComponent (unsafeFromPropsArray props :: {}) children

deck :: El
deck = el' _deck

foreign import _slideComponent :: ForeignReactComponent

_slide :: Array R.Props -> Array ReactElement -> ReactElement
_slide props children = createElement _slideComponent (unsafeFromPropsArray props :: {}) children

slide :: El
slide = el' _slide

foreign import _appearComponent :: ForeignReactComponent

_appear :: Array R.Props -> Array ReactElement -> ReactElement
_appear props children = createElement _appearComponent (unsafeFromPropsArray props :: {}) children

appear :: El
appear = el' _appear

foreign import _blockQuoteComponent :: ForeignReactComponent

_blockQuote :: Array R.Props -> Array ReactElement -> ReactElement
_blockQuote props children = createElement _blockQuoteComponent (unsafeFromPropsArray props :: {}) children

blockQuote :: El
blockQuote = el' _blockQuote

foreign import _quoteComponent :: ForeignReactComponent

_quote :: Array R.Props -> Array ReactElement -> ReactElement
_quote props children = createElement _quoteComponent (unsafeFromPropsArray props :: {}) children

quote :: El
quote = el' _quote

foreign import _citeComponent :: ForeignReactComponent

_cite :: Array R.Props -> Array ReactElement -> ReactElement
_cite props children = createElement _citeComponent (unsafeFromPropsArray props :: {}) children

cite :: El
cite = el' _cite

foreign import _codePaneComponent :: ForeignReactComponent

_codePane :: Array R.Props -> Array ReactElement -> ReactElement
_codePane props children = createElement _codePaneComponent (unsafeFromPropsArray props :: {}) children

codePane :: El
codePane = el' _codePane

foreign import _layoutComponent :: ForeignReactComponent

_layout :: Array R.Props -> Array ReactElement -> ReactElement
_layout props children = createElement _layoutComponent (unsafeFromPropsArray props :: {}) children

layout :: El
layout = el' _layout

foreign import _layoutFillComponent :: ForeignReactComponent

_layoutFill :: Array R.Props -> Array ReactElement -> ReactElement
_layoutFill props children = createElement _layoutFillComponent (unsafeFromPropsArray props :: {}) children

layoutFill :: El
layoutFill = el' _layoutFill

foreign import _layoutFitComponent :: ForeignReactComponent

_layoutFit :: Array R.Props -> Array ReactElement -> ReactElement
_layoutFit props children = createElement _layoutFitComponent (unsafeFromPropsArray props :: {}) children

layoutFit :: El
layoutFit = el' _layoutFit

foreign import _headingComponent :: ForeignReactComponent

_heading :: Array R.Props -> Array ReactElement -> ReactElement
_heading props children = createElement _headingComponent (unsafeFromPropsArray props :: {}) children

heading :: El
heading = el' _heading

foreign import _imageComponent :: ForeignReactComponent

_image :: Array R.Props -> Array ReactElement -> ReactElement
_image props children = createElement _imageComponent (unsafeFromPropsArray props :: {}) children

image :: El
image = el' _image

foreign import _linkComponent :: ForeignReactComponent

_link :: Array R.Props -> Array ReactElement -> ReactElement
_link props children = createElement _linkComponent (unsafeFromPropsArray props :: {}) children

link :: El
link = el' _link

foreign import _listItemComponent :: ForeignReactComponent

_listItem :: Array R.Props -> Array ReactElement -> ReactElement
_listItem props children = createElement _listItemComponent (unsafeFromPropsArray props :: {}) children

listItem :: El
listItem = el' _listItem

foreign import _listComponent :: ForeignReactComponent

_list :: Array R.Props -> Array ReactElement -> ReactElement
_list props children = createElement _listComponent (unsafeFromPropsArray props :: {}) children

list :: El
list = el' _list

foreign import _markdownComponent :: ForeignReactComponent

_markdown :: Array R.Props -> Array ReactElement -> ReactElement
_markdown props children = createElement _markdownComponent (unsafeFromPropsArray props :: {}) children

markdown :: El
markdown = el' _markdown

foreign import _textComponent :: ForeignReactComponent

_text :: Array R.Props -> Array ReactElement -> ReactElement
_text props children = createElement _textComponent (unsafeFromPropsArray props :: {}) children

text :: El
text = el' _text

foreign import _sComponent :: ForeignReactComponent

_s :: Array R.Props -> Array ReactElement -> ReactElement
_s props children = createElement _sComponent (unsafeFromPropsArray props :: {}) children

s :: El
s = el' _s

foreign import _tableComponent :: ForeignReactComponent

_table :: Array R.Props -> Array ReactElement -> ReactElement
_table props children = createElement _tableComponent (unsafeFromPropsArray props :: {}) children

table :: El
table = el' _table

foreign import _tableRowComponent :: ForeignReactComponent

_tableRow :: Array R.Props -> Array ReactElement -> ReactElement
_tableRow props children = createElement _tableRowComponent (unsafeFromPropsArray props :: {}) children

tableRow :: El
tableRow = el' _tableRow

foreign import _tableHeaderItemComponent :: ForeignReactComponent

_tableHeaderItem :: Array R.Props -> Array ReactElement -> ReactElement
_tableHeaderItem props children = createElement _tableHeaderItemComponent (unsafeFromPropsArray props :: {}) children

tableHeaderItem :: El
tableHeaderItem = el' _tableHeaderItem

foreign import _tableItemComponent :: ForeignReactComponent

_tableItem :: Array R.Props -> Array ReactElement -> ReactElement
_tableItem props children = createElement _tableItemComponent (unsafeFromPropsArray props :: {}) children

tableItem :: El
tableItem = el' _tableItem
