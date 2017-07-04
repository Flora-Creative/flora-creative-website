import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events
import Http
import String
import Dict

import Apps


main =
  Html.program
    { init = init "backend_url?"
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL: what should it be? I don't think a lot

type alias Model =
  { apps: Dict.Dict String Apps.App
  , focus: Maybe String
  }


-- UPDATE: either update an app's details or click on one?

type Msg = AppLoad (Result Http.Error String)
         | AppClick String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    AppLoad result ->
      -- decode app and assign into model
      (model, Cmd.none)

    AppClick clickedApp ->
      -- just update the current focus
      (model, Cmd.none)


-- VIEW: top level description, then dynamic stuff per app

banner : (Html msg)
banner =
  section [id "banner"]
  [ div [ class "inner" ]
    [ h2 [] [ text "flora project" ]
    , h3 [] [ text "audio effects" ]
    ]
  , div [ class "inner" ]
    [ p [ style [ ("text-alignment", "justify")
                , ("text-justify", "inter-word")
                ]
        ]
      [ text "The flora project was conceived as a suite of beautifully simple audio effects, cpu-effective audio effects for iOS devices, reminiscent of stomp-box style effects."
      , br [] []
      , br [] []
      , text "A simple and intuitive interface is presented with just the right number of parameters to allow users to quickly dial in the perfect sound."
      ]
    ]
  ]

view : Model -> Html msg
view model =
  body
  []
  [ banner
  ]



-- SUBSCRIPTIONS: probably none?

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- INIT: kick off loading the apps

init : String -> (Model, Cmd Msg)
init databaseURL =
  (Model Dict.empty Nothing , Cmd.none)
