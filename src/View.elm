module View exposing (..)

import Html exposing (..)
import Html.Attributes
import Html.Events
import Html.CssHelpers

import Dict

import Style
import SharedStyles
import Types exposing (..)

import Apps.View



-- VIEW: top level description, then dynamic stuff per app

view : Model -> Html msg
view model =
  body
  []
  (banner :: ( model.apps |> Dict.values |> List.map Apps.View.view ))



{ id, class, classList } =
    SharedStyles.indexNamespace


banner : (Html msg)
banner =
  section [ id SharedStyles.Banner ]
  [ div [ class [SharedStyles.Inner] ]
    [ h2 [ id SharedStyles.FloraHeader ] [ text "flora project" ]
    , h3 [ id SharedStyles.ProjectHeader ] [ text "audio effects" ]
    ]
  , div [ class [SharedStyles.Inner] ]
    [ p [ class [SharedStyles.Description] ]
      [ text "The flora project was conceived as a suite of beautifully simple audio effects, cpu-effective audio effects for iOS devices, reminiscent of stomp-box style effects."
      , br [] []
      , br [] []
      , text "A simple and intuitive interface is presented with just the right number of parameters to allow users to quickly dial in the perfect sound."
      ]
    ]
  ]
