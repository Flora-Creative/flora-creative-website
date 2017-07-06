module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import Html.CssHelpers

import Dict

import Style
import Types exposing (..)

import Apps.View



-- VIEW: top level description, then dynamic stuff per app

view : Model -> Html msg
view model =
  body
  []
  (banner :: ( model.apps |> Dict.values |> List.map Apps.View.view ))



{ id, class, classList } =
    Style.indexNamespace


banner : (Html msg)
banner =
  section [ id Style.Banner ]
  [ div [ class [Style.Inner] ]
    [ h2 [ id Style.FloraHeader ] [ text "flora project" ]
    , h3 [ id Style.ProjectHeader ] [ text "audio effects" ]
    ]
  , div [ class [Style.Inner] ]
    [ p [ class [Style.Description] ]
      [ text "The flora project was conceived as a suite of beautifully simple audio effects, cpu-effective audio effects for iOS devices, reminiscent of stomp-box style effects."
      , br [] []
      , br [] []
      , text "A simple and intuitive interface is presented with just the right number of parameters to allow users to quickly dial in the perfect sound."
      ]
    ]
  ]
