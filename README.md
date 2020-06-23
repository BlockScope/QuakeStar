## QuakeStar House Check

### Build Tools

We show how to get going with both stack and cabal. Pick either one or both.

Stack will install a compiler version and pick dependencies that are known to
work together. These are published on
[stackage.org](https://www.stackage.org/). We've picked a resolver in
[`./stack.yaml`](/stack.yaml).

The [stack](https://haskellstack.org) help landing page shows how to install
this build tool.

With [ghcup](https://www.haskell.org/ghcup/) we're able to install multiple GHC
versions and multiple cabal versions on a system but at the same time select
which one of each to work with so stack's GHC version set for this project and
the system one brought up by ghcup can be different.

```
% stack exec ghc -- --version
The Glorious Glasgow Haskell Compilation System, version 8.8.3
% ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.10.1
```

### Quick Start

* Download the source.
```
% git clone https://github.com/BlockScope/QuakeStar.git
% cd QuakeStar
```

* Fire up a REPL and have a go at [browsing](#browsing) the survey model.

```haskell
% stack repl
*QuakeStar> :set prompt "> "
>
```

```haskell
% cabal repl
*QuakeStar> :set prompt "> "
>
```

### <a name="browsing">Browse the Survey Model</a>
After we set the prompt, the sessions in each REPL are verbatim the same. We
can browse the model for a QuakeStar HouseCheck survey.
```haskell
> :browse
data Town = Town String
data Steepness = Flat | Gentle | Steep | VerySteep
data FoundationSoil = Sand | Gravel | Clay | Rock
data Prone = NotProne | ModeratelyProne | HighlyProne
data Epoch = Epoch0 | Epoch1 | Epoch2 | Epoch3 | Epoch4 | Epoch5
data Builder = LicensedBuilder | UnLicensedBuilder
data Design
  = DesignEngineer | DesignCompany | DesignBuilder Builder
data Solid = MoreSolid | AsSolid | NotAsSolid
data BracingSkew = MoreSkew | AsSkew | NotAsSkew
data TileWeight = LightTile | HeavyTile
data RoofCladding
  = RoofCladSteel
  | RoofCladTiles TileWeight
  | RoofCladMembrane
  | RoofCladConcrete
  | RoofCladOther
data WallCladding
  = WallCladConcrete
  | WallCladTimber
  | WallCladBrick
  | WallCladStucco
data SupportIdx = RoofSupport | FloorSupport Int | GroundSupport
data SteelWeight = LightSteel | HeavySteel
data SupportStructure
  = SupportTimber
  | SupportSteel SteelWeight
  | SupportConcrete
  | SupportOther
data FloorIdx = Ground | Upper Int | Basement Int
type Area = Double
data Pile = PileWood | PileConcrete
data FWall = FWallBrick | FWallConcrete
data FoundationStructure
  = FoundationWall FWall
  | FoundationPile Pile
  | FoundationPole
  | FoundationSlab
data FloorStructure
  = FloorTimber
  | FloorSteel
  | FloorConcrete
  | FloorEarth
  | FloorOther
data Bracing
  = BracingPlaster
  | BracingPlywood
  | BracingSteel
  | BracingConcreteBlock
  | BracingConcrete
  | BracingBrick
data Axes a = Axes {x :: a, y :: a}
data FallingMaterial
  = FallingBrick | FallingConcrete | FallingLight
data FallingHazard = Chimney | Parapet | Veneer
type Walls = [(FloorIdx, WallCladding)]
type Structures = [(FloorIdx, FloorStructure)]
type Areas = [(FloorIdx, Area)]
type Bracings = [(FloorIdx, Axes Bracing)]
type Fallings = [(FallingHazard, FallingMaterial)]
data Star = Star0 | Star1 | Star2 | Star3 | Star4 | Star5
data SurveyTell
  = SurveyTell {town :: Town,
                steepness :: Steepness,
                foundationSoil :: FoundationSoil,
                liquifaction :: Maybe Prone,
                epoch :: Epoch,
                design :: Design,
                solidity :: Solid,
                levels :: [FloorIdx],
                roof :: RoofCladding,
                walls :: Walls,
                structures :: Structures,
                bracings :: Bracings,
                foundationStructure :: FoundationStructure,
                areas :: Areas,
                bracingWalls :: Bracings,
                bracingSkew :: (FloorIdx, BracingSkew),
                fallings :: Fallings}
class Survey a where
  surveyAsk :: a -> SurveyTell
  {-# MINIMAL surveyAsk #-}
score :: SurveyTell -> Star
```
