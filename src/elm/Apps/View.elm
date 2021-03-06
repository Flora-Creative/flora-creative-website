module Apps.View exposing (view, appHeader)

import Html exposing (..)
import Html.Attributes exposing (..)
import Css
import Apps.Types exposing (..)
import Apps.Style exposing (appNamespace)
import SharedStyles exposing (..)
import List
import Dict


{ id, class, classList } =
    appNamespace


appColorStyles : AppModel -> Html.Attribute msg
appColorStyles app =
    [ app.app.backgroundColor |> Css.hex |> Css.backgroundColor
    , app.app.foregroundColor |> Css.hex |> Css.color
    ]
        |> Css.asPairs
        |> Html.Attributes.style


appNavIcon : AppModel -> Html msg
appNavIcon app =
    a [ href <| "#" ++ app.app.shortName ]
        [ img [ src app.app.appIcon, class [ AppIcon ] ] [] ]


appHeader : AppCollection -> Html msg
appHeader model =
    div [ class [ PinnedHeader ] ]
        [ div [ class [ HeaderIconContainer ] ]
            << List.map appNavIcon
            << Dict.values
          <|
            model
        ]


appSectionAttributes : AppModel -> List (Html.Attribute msg)
appSectionAttributes app =
    [ appColorStyles app
    , class [ Wrapper ]
    , Html.Attributes.id app.app.auIdentifier
    ]


appSectionWrapper : AppModel -> List (Html msg) -> Html msg
appSectionWrapper app children =
    (app |> appSectionAttributes |> section) <| children


appTitleStyle : AppModel -> Html.Attribute msg
appTitleStyle app =
    [ Css.borderBottom3 (Css.px 2) Css.solid (Css.hex app.app.foregroundColor) ]
        |> Css.asPairs
        |> Html.Attributes.style


appTitle : AppModel -> Html msg
appTitle app =
    h2 [ appTitleStyle app, class [ MajorHeading ] ] [ text app.app.appName ]


embedGalleryItem : GalleryItem -> Html msg
embedGalleryItem item =
    let
        itemHtml =
            case item of
                Image url ->
                    img [ src url ] []

                Video url ->
                    iframe
                        [ src url
                        , width 640
                        , height 360
                        , attribute "frameborder" "0"
                        ]
                        []
    in
        div [] [ itemHtml ]


carouselStyle : Html.Attribute msg
carouselStyle =
    [ Css.width (Css.pct 75)
    , Css.display Css.block
    , Css.textAlign Css.center
    , Css.height (Css.px 600)
    ]
        |> Css.asPairs
        >> Html.Attributes.style


appGallery : AppModel -> Html msg
appGallery app =
    div [ class [ "carousel" ], carouselStyle ] <|
        List.map embedGalleryItem <|
            app.galleryItems


descriptionStyle : AppModel -> Html.Attribute msg
descriptionStyle app =
    [ Css.borderTop3 (Css.px 2) Css.solid (Css.hex app.app.foregroundColor) ]
        |> Css.asPairs
        |> Html.Attributes.style


appDescription : AppModel -> Html msg
appDescription app =
    p [ descriptionStyle app ] [ text app.app.appDescription ]


appStoreImg : Html msg
appStoreImg =
    img [ Html.Attributes.src "/images/app_store_badge.svg" ] []


appStoreButton : AppModel -> Html msg
appStoreButton app =
    a [ Html.Attributes.href app.app.itunesUrl ] [ appStoreImg ]


appContents : AppModel -> Html msg
appContents app =
    div [ class [ Inner ] ]
        [ div [ class [ Content ] ]
            [ div [ class [ Spacer ] ] []
            , appTitle app
            , appGallery app
            , appDescription app
            , appStoreButton app
            , br [] []
            , br [] []
            ]
        ]



-- VIEW: what does an app look like?


view : AppModel -> Html msg
view app =
    [ appContents app ]
        |> appSectionWrapper app
