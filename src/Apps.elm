-- Handles representations of apps
module Apps exposing (..)

import Html exposing (..)

import Styles exposing (..)


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


-- VIEW: what does an app look like?
view : App -> Html msg
view app =
  div [] [ text app.name ]
