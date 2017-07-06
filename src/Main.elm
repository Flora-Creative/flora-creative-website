-- entry point

import Html

import View
import State


main =
  Html.program
    { update = State.update
    , init = State.initialState "backend_url?"
    , subscriptions = State.subscriptions
    , view = View.view
    }
