module Apps.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import Html.CssHelpers

import Apps.Types exposing (App)

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
