module QuakeStar where

data Town = Town String deriving Show

data Steepness
    = Flat
    | Gentle
    | Steep
    | VerySteep
    deriving Show

data FoundationSoil
    = Sand
    | Gravel
    | Clay
    | Rock
    deriving Show

data Prone
    = NotProne
    | ModeratelyProne
    | HighlyProne
    deriving Show

data Epoch
    = Epoch0 -- ^ years < 1935
    | Epoch1 -- ^ 1935 <= years < 1965
    | Epoch2 -- ^ 1965 <= years < 1976
    | Epoch3 -- ^ 1976 <= years < 1992
    | Epoch4 -- ^ 1992 <= years < 2004
    | Epoch5 -- ^ 2004 <= years

instance Show Epoch where
    show Epoch0 = "years < 1935"
    show Epoch1 = "1935 <= years < 1965"
    show Epoch2 = "1965 <= years < 1976"
    show Epoch3 = "1976 <= years < 1992"
    show Epoch4 = "1992 <= years < 2004"
    show Epoch5 = "2004 <= years"

data Builder = LicensedBuilder | UnLicensedBuilder deriving Show

data Design
    = DesignEngineer
    | DesignCompany
    | DesignBuilder Builder
    deriving Show

data Solid = MoreSolid | AsSolid | NotAsSolid deriving Show

-- | When 'Not' skewed, distribution is even, 'Mod' is a bit to one side and
-- 'High' is well to one side.
data BracingSkew = MoreSkew | AsSkew | NotAsSkew deriving Show

data TileWeight = LightTile | HeavyTile deriving Show

data RoofCladding
    = RoofCladSteel
    | RoofCladTiles TileWeight
    | RoofCladMembrane
    | RoofCladConcrete
    | RoofCladOther
    deriving Show

data WallCladding
    = WallCladConcrete
    | WallCladTimber
    | WallCladBrick
    | WallCladStucco
    deriving Show

data SupportIdx
    = RoofSupport
    | FloorSupport Int
    | GroundSupport

data SteelWeight = LightSteel | HeavySteel

data SupportStructure
    = SupportTimber
    | SupportSteel SteelWeight
    | SupportConcrete
    | SupportOther

data FloorIdx
    = Ground
    | Upper Int
    | Basement Int
    deriving Show

type Area = Double

data Pile = PileWood | PileConcrete deriving Show
data FWall = FWallBrick | FWallConcrete deriving Show

data FoundationStructure
    = FoundationWall FWall
    | FoundationPile Pile
    | FoundationPole
    | FoundationSlab
    deriving Show

data FloorStructure
    = FloorTimber
    | FloorSteel
    | FloorConcrete
    | FloorEarth
    | FloorOther
    deriving Show

data Bracing
    = BracingPlaster
    | BracingPlywood
    | BracingSteel
    | BracingConcreteBlock
    | BracingConcrete
    | BracingBrick
    deriving Show

-- | Where 'x' is the major and 'y' is the minor axis.
data Axes a = Axes {x :: a, y :: a} deriving Show

data FallingMaterial
    = FallingBrick
    | FallingConcrete
    | FallingLight
    deriving Show

data FallingHazard = Chimney | Parapet | Veneer deriving Show

type Walls = [(FloorIdx, WallCladding)]
type Structures = [(FloorIdx, FloorStructure)]
type Areas = [(FloorIdx, Area)]
type Bracings = [(FloorIdx, Axes Bracing)]
type Fallings = [(FallingHazard, FallingMaterial)]

data Star = Star0 | Star1 | Star2 | Star3 | Star4 | Star5 deriving (Eq, Ord, Show)

-- TODO: Questions are numbered but number 12 is repeated.
data SurveyTell =
    SurveyTell
        { town :: Town
        -- ^ Question 1: What is the nearest place to your house?
        , steepness :: Steepness
        -- ^ Question 2: How steep is your site?
        , foundationSoil :: FoundationSoil
        -- ^ Question 3: What is the foundation soil?
        , liquifaction :: Maybe Prone
        -- ^ Question 4: How liquefaction-prone is your site?
        , epoch :: Epoch
        -- ^ Question 5: When was the house built or most recently re-modelled?
        , design :: Design
        -- ^ Question 6: Who was responsible for the structural design?
        , solidity :: Solid
        -- ^ Question 7: How would you describe the overall construction?
        , levels :: [FloorIdx]
        -- ^ Question 8: How many levels are there?
        , roof :: RoofCladding
        -- ^ Question 9: What is the cladding on the roof?
        , walls :: Walls
        -- ^ Question 10: What are the walls clad in or made of?
        , structures :: Structures
        -- ^ Question 11: What is the floor structure of each level?
        , bracings :: Bracings
        -- ^ Question 12: What are the supporting columns and/or walls made of?
        , foundationStructure :: FoundationStructure
        -- ^ Question 12: Foundations. What type of foundations does your house have?
        , areas :: Areas
        -- ^ Question 13: Floor Areas.
        , bracingWalls :: Bracings
        -- ^ Question 14: Bracing walls.
        , bracingSkew :: (FloorIdx, BracingSkew)
        -- ^ Question 15: Bracing wall distribution on Ground Floor.
        , fallings :: Fallings
        -- ^ Question 16: Chimneys, parapets and heavy cladding.
        }
    deriving Show

class Survey a where
    surveyAsk :: a -> SurveyTell

-- TODO: Get the formula for and implement score.
score :: SurveyTell -> Star
score = undefined
