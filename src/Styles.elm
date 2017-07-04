port module Styles exposing (..)

import Css.File exposing (CssFileStructure, CssCompilerProgram)
import Styles.Index

port files : CssFileStructure  -> Cmd msg

fileStructure : CssFileStructure
fileStructure =
  Css.File.toFileStructure
    [ ( "index.css", Css.File.compile [ Styles.Index.css ] ) ]


main : CssCompilerProgram
main =
  Css.File.compiler files fileStructure
