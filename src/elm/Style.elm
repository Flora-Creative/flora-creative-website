module Style exposing (css)

import Css exposing (..)
import Css.Elements
    exposing
        ( body
        , h1
        , h2
        , h3
        , h4
        , h5
        , h6
        )
import Css.Namespace exposing (namespace)
import SharedStyles exposing (..)


-- This is the top level style, which should apply by default :)
-- ACTUAL CSS DEFINITIONS


bannerStyle : List Style
bannerStyle =
    [ backgroundColor (hex "#edeae3")
    , padding4 (Css.em 5) (Css.em 2) (Css.em 4.25) (Css.em 2)
    , marginBottom (Css.em -2.5)
    ]



-- style basics that everyone should inherit


defaultStyle : List Style
defaultStyle =
    [ color (hex "#444140")
    , fontFamilies [ "Avenir", "Helvetica Neue", "Sans-Serif" ]
    , letterSpacing (Css.em 0.1)
    ]


floraHeaderStyle : List Style
floraHeaderStyle =
    [ fontSize (Css.em 4.5)
    , marginBottom (Css.em 0.2)
    , paddingBottom (Css.em 0.1)
    , color (hex "#444140")
    , textAlign center
    , fontWeight (int 700)
    , letterSpacing (Css.em 0.1)
    , margin4 (Css.em 0) (Css.em 0) (Css.em 1) (Css.em 0)
    , borderBottom3 (px 2) solid (rgba 255 255 255 0.125)
    ]


projectHeaderStyle : List Style
projectHeaderStyle =
    [ fontSize (Css.em 2.25)
    , paddingBottom (Css.em 0.1)
    , textAlign center
    , margin4 (Css.em 0) (Css.em 0) (Css.em 0.1) (Css.em 0)
    ]


innerStyle : List Style
innerStyle =
    [ margin auto ]


descriptionStyle : List Style
descriptionStyle =
    [ fontSize (Css.em 0.8)
    , fontWeight (int 200)
    , lineHeight (int 2)
    , textTransform lowercase
    ]


majorHeadingStyle : List Style
majorHeadingStyle =
    [ paddingBottom (Css.em 1)
    , fontSize (Css.em 1.5)
    , fontWeight (Css.int 700)
    , letterSpacing (Css.em 0.1)
    ]



-- stick it all together to generate static css


css : Stylesheet
css =
    (stylesheet << namespace indexNamespace.name)
        [ body defaultStyle
        , class Inner innerStyle
        , class Description descriptionStyle
        , class MajorHeading majorHeadingStyle
        , id FloraHeader floraHeaderStyle
        , id ProjectHeader projectHeaderStyle
        , id Banner bannerStyle
        ]
