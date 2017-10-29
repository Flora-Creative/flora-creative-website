-- entry point


module Main exposing (..)

import Html
import RouteUrl exposing (RouteUrlProgram)
import Types exposing (Model, Msg)
import View
import State


main : RouteUrlProgram Never Model Msg
main =
    RouteUrl.program
        { update = State.update
        , init = State.initialState "http://imac.local:8080"
        , subscriptions = State.subscriptions
        , view = View.view
        , delta2url = State.delta2hash
        , location2messages = State.location2messages
        }
