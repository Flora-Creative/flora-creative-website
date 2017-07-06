module Style exposing (css)

import Css exposing (..)
import Css.Elements exposing (body)
import Css.Namespace exposing (namespace)

import SharedStyles exposing (..)

-- This is the top level style, which should apply by default :)

-- ACTUAL CSS DEFINITIONS

bannerStyle =
  [ backgroundColor (hex "#edeae3")
  , padding4 (Css.em 5) (Css.em 2) (Css.em 4.25) (Css.em 2)
  , marginBottom (Css.em -2.5) ]

-- style basics that everyone should inherit
defaultStyle =
  [ color (hex "#444140")
  , fontFamilies [ "Avenir", "Helvetica Neue" ]
  , letterSpacing (Css.em 0.1)
  ]

floraHeaderStyle =
  [ fontSize (Css.em 1.5)
  , marginBottom (Css.em 0.2)
  , paddingBottom (Css.em 0.1)
  , color (hex "#444140")
  , textAlign center
  , fontWeight (int 700)
  , letterSpacing (Css.em 0.1)
  , margin4 (Css.em 0) (Css.em 0) (Css.em 1) (Css.em 0)
  , borderBottom3 (px 2) solid (rgba 255 255 255 0.125)
  ]

projectHeaderStyle =
  [ fontSize (Css.em 2.25)
  , paddingBottom (Css.em 0.1)
  , textAlign center
  , margin4 (Css.em 0) (Css.em 0) (Css.em 0.1) (Css.em 0)
  ]

innerStyle =
  [ margin auto ]

descriptionStyle =
  [ fontSize (Css.em 0.8)
  , fontWeight (int 200)
  , lineHeight (int 2)
  , textTransform lowercase
  ]

-- stick it all together to generate static css
css =
  (stylesheet << namespace indexNamespace.name)
  [ body defaultStyle
  , class Inner innerStyle
  , class Description descriptionStyle
  , id FloraHeader floraHeaderStyle
  , id ProjectHeader projectHeaderStyle
 ]

-- css =
  -- (stylesheet << namespace indexNamespace)
  -- [id Inner [margin auto]]
