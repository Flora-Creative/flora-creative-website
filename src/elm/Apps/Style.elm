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
            [ Css.width (Css.pct 60)
            , Css.marginBottom (Css.cm 2)
            ]
        , Css.class Wrapper
            [ Css.width (Css.pct 100)
            , Css.display Css.inlineBlock
            ]
        , Css.class Spacer [ Css.marginBottom (Css.cm 1.5) ]
        ]
