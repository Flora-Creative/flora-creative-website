module Apps.Types exposing (..)

-- APP: info about a flora app
-- what we get back from the API will be a slightly more awkward version of
-- this, we will convert it to this type when we receive it to be able to do
-- things like cycle through images/videos more conveniently and keep track of
-- which image/video is currently active

type GalleryItem = Image String
                 | Video String

type ScrollState = Playing
                 | Paused

type alias App =
  { appName:          String
  , galleryItems:     List GalleryItem
  , activeItem:       Int               -- int for cycling
  , scrollState:      ScrollState
  , appDescription:   String
  , itunesUrl:        String
  , backgroundColor:  String
  , foregroundColor:  String
  , auIdentifier:     String
  , appIcon:          String
  , shortName:        String
  }
