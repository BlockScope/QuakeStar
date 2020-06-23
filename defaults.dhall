{ version =
    "0.1.0"
, author =
    "Phil de Joux"
, maintainer =
    "phil.dejoux@blockscope.com"
, copyright =
    "\u00A9 2020 Phil de Joux, \u00A9 2020 Block Scope Limited"
, license =
    "MPL-2.0"
, license-file =
    "LICENSE.md"
, tested-with =
    "GHC == 8.8.3"
, extra-source-files =
    [ "defaults.dhall", "package.dhall", "README.md" ]
, ghc-options =
    [ "-Wall"
    , "-Werror"
    , "-Wincomplete-uni-patterns"
    , "-Wcompat"
    , "-Widentities"
    , "-Wredundant-constraints"
    , "-fhide-source-paths"
    ]
}
