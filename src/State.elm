module State exposing (initialState, update, subscriptions)

import Dict
import Debug exposing (log)

import Types exposing (..)
import Apps.State


-- This is where we deal with the updates to the model etc.
--UPDATE: update an app's details or scroll us to one


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    AppsLoad (Ok result) ->
      -- decode apps and assign into model
      ( { model | apps = Apps.State.decodeAppsList result }, Cmd.none )

    AppsLoad (Err error) ->
      -- ignore errors for now
      let
        err = log "error " error
      in
        ( model,  Cmd.none )

    AppClick clickedApp ->
      -- just update the current focus
      ( model, Cmd.none )


-- SUBSCRIPTIONS: probably none?


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none



-- INIT: kick off loading the apps


initialState : String -> ( Model, Cmd Msg )
initialState databaseURL =
  ( Model Dict.empty Nothing, Apps.State.getAll databaseURL )
