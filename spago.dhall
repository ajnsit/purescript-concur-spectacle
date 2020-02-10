{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "concur-spectacle"
, dependencies =
    [ "concur-react"
    ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
