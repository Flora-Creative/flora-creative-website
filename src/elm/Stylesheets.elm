port module Stylesheets exposing (..)

import Css
import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Style
import Apps.Style


port files : CssFileStructure -> Cmd msg



-- all the CSS to concatenate


allCss : List Css.Stylesheet
allCss =
    [ Style.css
    , Apps.Style.css
    ]


fileStructure : CssFileStructure
fileStructure =
    Css.File.toFileStructure
        [ ( "src/static/all.css", Css.File.compile allCss ) ]


main : CssCompilerProgram
main =
    Css.File.compiler files fileStructure
