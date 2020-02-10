{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "concur-spectacle"
, dependencies =
    [ "aff"
    , "arrays"
    , "avar"
    , "concur-core"
    , "concur-react"
    , "effect"
    , "foldable-traversable"
    , "free"
    , "nonempty"
    , "react"
    , "react-dom"
    , "tailrec"
    , "web-dom"
    , "web-html"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
