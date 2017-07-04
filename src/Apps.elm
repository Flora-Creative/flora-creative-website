-- Handles representations of apps
module Apps exposing (..)


type alias App =
  { name: String
  , gallery: List String
  , description: String
  , storeURL: String
  , colour: String
  }


-- loading

fromJson : String -> App
fromJson jsonApp =
  { name = "test"
  , gallery = []
  , description = "a test"
  , storeURL = "nothing"
  , colour = "#ffeedd"
  }
