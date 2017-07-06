module Style exposing (..)

import Html
import Html.Attributes
import Html.CssHelpers exposing (withNamespace)
import Css exposing (..)
import Css.Elements
import Css.Namespace exposing (namespace)

import SharedStyles exposing (..)

-- This is the top level style, which should apply by default :)

-- ACTUAL CSS DEFINITIONS

bannerStyle =
  [ backgroundColor (hex "#edeae3")
  , padding4 (em 5) (em 2) (em 4.25) (em 2)
  , marginBottom (em -2.5) ]

-- style basics that everyone should inherit
defaultStyle =
  [ color (hex "#44140")
  , fontFamilies [ "Avenir", "Helvetica Neue" ]
  , letterSpacing (em 0.1)]

floraHeaderStyle =
  [ fontSize (em 1.5)
  , marginBottom (em 0.2)
  , paddingBottom (em 0.1)
  , color (hex "#444140")
  , textAlign center
  , fontWeight (int 700)
  , letterSpacing (em 0.1)
  , margin4 (em 0) (em 0) (em 1) (em 0)
  , borderBottom3 (px 2) solid (rgba 255 255 255 0.125)]

projectHeaderStyle =
  [ fontSize (em 2.25)
  , paddingBottom (em 0.1)
  , textAlign center
  , margin4 (em 0) (em 0) (em 0.1) (em 0) ]

innerStyle =
  [ margin auto ]

descriptionStyle =
  [ fontSize (em 0.8)
  , fontWeight (int 200)
  , lineHeight (int 2)
  , textTransform lowercase ]

-- stick it all together to generate static css
css =
  (stylesheet << namespace indexNamespace.name)
  [ Css.Elements.body defaultStyle
  , class Inner innerStyle
  , class Description descriptionStyle
  , id FloraHeader floraHeaderStyle
  , id ProjectHeader projectHeaderStyle
  ]
