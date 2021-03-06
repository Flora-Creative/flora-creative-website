module Apps.Types exposing (..)

import Dict
import Generated.API exposing (IOSApp)


type GalleryItem
    = Image String
    | Video String


type ScrollState
    = Playing
    | Paused


type alias AppModel =
    { galleryItems : List GalleryItem
    , activeItem : Int -- int for cycling
    , scrollState : ScrollState
    , app : IOSApp
    }


type alias AppCollection =
    Dict.Dict String AppModel
