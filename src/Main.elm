-- entry point

import Html

import View
import State


main =
  Html.program
    { update = State.update
    , init = State.initialState "http://imac.local:8080"
    , subscriptions = State.subscriptions
    , view = View.view
    }
