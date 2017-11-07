module SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)


-- Style types and helpers that everyone needs to see
-- This is the top level stuff, submodules etc. can have their own
-- you will just have to make sure the generator is aware by editing
-- Stylesheets.elm


type CssClasses
    = Inner
    | Description
    | Content
    | Wrapper
    | Spacer
    | PinnedHeader
    | HeaderIconContainer
    | AppIcon


type CssIds
    = Banner
    | FloraHeader
    | ProjectHeader


indexNamespace =
    withNamespace "flora"
