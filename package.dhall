    let defs = ./defaults.dhall

in    defs
    ⫽ { name =
          "quakestar"
      , synopsis =
          "QuakeStar House Check Rules"
      , github =
          "blockscope/quakestar"
      , dependencies =
          [ "base", "containers" ]
      , ghc-options =
          [ "-Wall"
          , "-Werror"
          , "-Wincomplete-uni-patterns"
          , "-Wcompat"
          , "-Widentities"
          , "-Wredundant-constraints"
          , "-fhide-source-paths"
          ]
      , library =
          { source-dirs =
              "src"
          , dependencies =
              [ "base" ]
          , exposed-modules =
              [ "QuakeStar" ]
          , other-modules =
              [] : List Text
          }
      }
