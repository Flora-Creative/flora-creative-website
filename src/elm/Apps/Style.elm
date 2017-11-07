module Apps.Style exposing (..)

import Html.CssHelpers exposing (withNamespace)
import Css
import Css.Namespace exposing (namespace)
import SharedStyles exposing (..)


-- app specific styling


appNamespace =
    withNamespace "app"


css : Css.Stylesheet
css =
    (Css.stylesheet << namespace appNamespace.name)
        [ Css.class Content
            [ Css.width (Css.pct 100)
            , Css.margin4 (Css.cm 0) (Css.cm 0) (Css.cm 2) (Css.cm 0)
            , Css.display Css.inlineBlock
            , Css.boxSizing Css.borderBox
            ]
        , Css.class Wrapper
            [ Css.width (Css.pct 100)
            , Css.display Css.inlineBlock
            ]
        , Css.class Spacer [ Css.marginBottom (Css.cm 1.5) ]
        , Css.class PinnedHeader
            [ Css.backgroundColor (Css.hex "#2e3141")
            , Css.height (Css.em 4)
            , Css.position Css.fixed
            , Css.top (Css.px 0)
            , Css.left (Css.px 0)
            , Css.width (Css.pct 100)
            , Css.zIndex (Css.int 100)
            , Css.display Css.inlineBlock
            ]
        , Css.class AppIcon
            [ Css.marginLeft (Css.em 0.5)
            , Css.marginRight (Css.em 0.5)
            , Css.marginTop (Css.em 0.5)
            , Css.height (Css.em 2.8)
            , Css.width (Css.em 2.8)
            , Css.borderRadius (Css.pct 10)
            , Css.zIndex (Css.int 100)
            , Css.display Css.inlineBlock
            ]
        , Css.class HeaderIconContainer
            [ Css.textAlign Css.center ]
        , Css.class Inner
            [ Css.textAlign Css.right
            , Css.flexDirection Css.rowReverse
            , Css.alignItems Css.flexStart
            , Css.displayFlex
            , Css.padding4 (Css.em 2.0) (Css.em 2.0) (Css.em 0.1) (Css.em 2.0)
            , Css.width (Css.pct 100)
            , Css.margin2 (Css.em 0) Css.auto
            ]
        ]
