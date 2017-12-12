module Apps.State exposing (..)

import Http
import Dict
import List
import Types
import Carousel
import Apps.Types exposing (GalleryItem, AppModel)
import Generated.API exposing (IOSApp)


onAppLoad : Types.Model -> Cmd msg
onAppLoad _ =
    Carousel.initCarousel "appcarousel"



-- TODO: don't hardcode


getAll : String -> Cmd Types.Msg
getAll baseUrl =
    Http.send Types.AppsLoad (Generated.API.get baseUrl)


createGalleryList : IOSApp -> List GalleryItem
createGalleryList app =
    let
        imgs =
            List.map Apps.Types.Image app.images

        vids =
            List.map Apps.Types.Video app.videoLinks
    in
        List.concat [ imgs, vids ]


decodeApp : IOSApp -> AppModel
decodeApp floraApp =
    { galleryItems = createGalleryList floraApp
    , activeItem = 0
    , scrollState = Apps.Types.Playing
    , app = floraApp
    }


makeDictKeyPair : AppModel -> ( String, AppModel )
makeDictKeyPair app =
    ( app.app.shortName, app )


decodeAppsList : List IOSApp -> Dict.Dict String AppModel
decodeAppsList appsList =
    appsList
        |> List.map (decodeApp >> makeDictKeyPair)
        |> Dict.fromList
