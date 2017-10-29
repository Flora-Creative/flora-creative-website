module Apps.Types exposing (..)

import Generated.AppAPI exposing (Floraapps)


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
    , app : Floraapps
    }