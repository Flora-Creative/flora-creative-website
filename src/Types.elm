module Types exposing (..)

import Dict
import Http

import Apps.Types exposing (App)

-- The types that everyone needs to see

-- MODEL: what should it be? I don't think a lot

type alias Model =
  { apps: Dict.Dict String App
  , focus: Maybe String
  }


-- MESSAGES: an app has loaded or someone clicked on the little nav guy

type Msg = AppLoad (Result Http.Error String)
         | AppClick String
