module SharedStyles exposing (..)

import Html.CssHelpers exposing (withNamespace)

-- Style types and helpers that everyone needs to see
-- This is the top level stuff, submodules etc. can have their own


type CssClasses = Inner
                | Description


type CssIds = Banner
            | FloraHeader
            | ProjectHeader


indexNamespace =
  withNamespace "index"
