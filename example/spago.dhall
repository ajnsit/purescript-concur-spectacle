{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "concur-spectacle-example"
, dependencies = [
    "concur-spectacle"
  , "console"
  , "effect"
  , "psci-support"
  ]
, packages = ../packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
