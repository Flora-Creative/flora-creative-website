port module Stylesheets exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Style
import Apps.Style

port files : CssFileStructure  -> Cmd msg

-- all the CSS to concatenate
allCss =
  [ Style.css
  , Apps.Style.css
  ]

fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "site/gen/css/index.css", Css.File.compile allCss ) ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
