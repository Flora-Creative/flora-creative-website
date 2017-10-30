module State exposing (..)

import Dict
import Debug exposing (log)
import RouteUrl exposing (UrlChange)
import RouteUrl.Builder
import Navigation exposing (Location)
import UrlParser
import Types exposing (..)
import Apps.State


-- This is where we deal with the updates to the model etc.
--UPDATE: update an app's details or scroll us to one


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        AppsLoad (Ok result) ->
            -- decode apps and assign into model
            let
                newModel =
                    { model | apps = Apps.State.decodeAppsList result }
            in
                ( newModel, Apps.State.onAppLoad newModel )

        AppsLoad (Err error) ->
            -- ignore errors for now
            let
                err =
                    log "error " error
            in
                ( model, Cmd.none )

        AppClick clickedApp ->
            -- just update the current focus
            ( model, Cmd.none )



-- see if we need a new URL


delta2hash : Model -> Model -> Maybe UrlChange
delta2hash previous current =
    Maybe.map RouteUrl.Builder.toHashChange <| delta2builder previous current


delta2builder : Model -> Model -> Maybe RouteUrl.Builder.Builder
delta2builder previous current =
    case current.focus of
        Just appName ->
            -- could be legit
            Just (RouteUrl.Builder.fromUrl appName)

        Nothing ->
            Nothing



-- turn a different url into messages for the update


location2messages : Location -> List Msg
location2messages location =
    case UrlParser.parseHash UrlParser.string location of
        Just appName ->
            [ AppClick appName ]

        Nothing ->
            []



-- SUBSCRIPTIONS: probably none?


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- INIT: kick off loading the apps


initialState : String -> ( Model, Cmd Msg )
initialState databaseURL =
    ( Model Dict.empty Nothing, Apps.State.getAll databaseURL )
