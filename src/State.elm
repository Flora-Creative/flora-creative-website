module State exposing (initialState, update, subscriptions)

import Dict

import Types exposing (..)

-- This is where we deal with the updates to the model etc.


--UPDATE: update an app's details or scroll us to one

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    AppLoad result ->
      -- decode app and assign into model
      (model, Cmd.none)

    AppClick clickedApp ->
      -- just update the current focus
      (model, Cmd.none)


-- SUBSCRIPTIONS: probably none?

subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- INIT: kick off loading the apps

initialState : String -> (Model, Cmd Msg)
initialState databaseURL =
  (Model Dict.empty Nothing , Cmd.none)
