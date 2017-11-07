module Types exposing (..)

import Dict
import Http
import Apps.Types exposing (AppCollection)
import Generated.API exposing (IOSApp)


-- The types that everyone needs to see
-- MODEL: what should it be? I don't think a lot


type alias Model =
    { apps : AppCollection
    , focus : Maybe String
    }



-- MESSAGES: an app has loaded or someone clicked on the little nav guy


type Msg
    = AppsLoad (Result Http.Error (List IOSApp))
    | AppClick String
