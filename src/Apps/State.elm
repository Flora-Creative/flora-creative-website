module Apps.State exposing (..)

import Http
import Dict
import List

import Types
import Apps.Types exposing (GalleryItem, AppModel)

import Generated.AppAPI


getAll : String -> Cmd Types.Msg
getAll baseUrl =
  Http.send Types.AppsLoad (Generated.AppAPI.get baseUrl)


createGalleryList : Generated.AppAPI.Floraapps -> List GalleryItem
createGalleryList app =
  let
    imgs = List.map Apps.Types.Image app.images
    vids = List.map Apps.Types.Video app.videoLinks
  in
    List.concat [ imgs, vids ]


decodeApp : Generated.AppAPI.Floraapps -> AppModel
decodeApp floraApp =
  { galleryItems = createGalleryList floraApp
  , activeItem = 0
  , scrollState = Apps.Types.Playing
  , app = floraApp
  }


makeDictKeyPair : AppModel -> (String, AppModel)
makeDictKeyPair app =
  (app.app.shortName, app)


decodeAppsList : List Generated.AppAPI.Floraapps -> Dict.Dict String AppModel
decodeAppsList appsList =
  appsList
    |> List.map (decodeApp >> makeDictKeyPair)
    |> Dict.fromList
