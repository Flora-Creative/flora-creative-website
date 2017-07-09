module Apps.View exposing (view)

import Html exposing (..)
import Html.Attributes
import Css
import Apps.Types exposing (..)
import Apps.Style exposing (appNamespace)
import SharedStyles exposing (..)


{ id, class, classList } =
  appNamespace


appColorStyles : App -> Html.Attribute msg
appColorStyles app =
  [ app.backgroundColor |> Css.hex |> Css.backgroundColor
  , app.foregroundColor |> Css.hex |> Css.color
  ]
    |> Css.asPairs
    |> Html.Attributes.style


appSectionAttributes : App -> List (Html.Attribute msg)
appSectionAttributes app =
  [ appColorStyles app
  , class [ Wrapper ]
  , Html.Attributes.id app.auIdentifier
  ]


appSectionWrapper : App -> List (Html msg) -> Html msg
appSectionWrapper app children =
  (app |> appSectionAttributes |> section) <| children


appTitleStyle : App -> Html.Attribute msg
appTitleStyle app =
  [ Css.borderBottom3 (Css.px 2) Css.solid (Css.hex app.foregroundColor) ]
    |> Css.asPairs
    |> Html.Attributes.style


appTitle : App -> Html msg
appTitle app =
    h2 [ appTitleStyle app ] [ text app.appName ]


embedGalleryItem : GalleryItem -> Html msg
embedGalleryItem item =
  let
    itemText =
      case item of
        Image url ->
          text (url ++ "  (image)")

        Video url ->
          text (url ++ "  (video)")
  in
    li [] [ itemText ]



-- THIS guy is going to be a pain


appGallery : App -> Html msg
appGallery app =
  ul [] <| List.map embedGalleryItem <| app.galleryItems


descriptionStyle : App -> Html.Attribute msg
descriptionStyle app =
  [ Css.borderTop3 (Css.px 2) Css.solid (Css.hex app.foregroundColor) ]
    |> Css.asPairs
    |> Html.Attributes.style


appDescription : App -> Html msg
appDescription app =
  p [ descriptionStyle app ] [ text app.appDescription ]


appStoreImg : Html msg
appStoreImg =
  img [ Html.Attributes.src "/assets/images/app_store_badge.svg" ] []

appStoreButton : App -> Html msg
appStoreButton app =
  a [ Html.Attributes.href app.itunesUrl ] [ appStoreImg ]


appContents : App -> Html msg
appContents app =
  div [ class [ Inner ] ]
    [ div [ class [ Content ] ]
      [ div [ class [ Spacer ] ] []
      , appTitle app
      , appGallery app
      , appDescription app
      , appStoreButton app
      ]
    ]



-- VIEW: what does an app look like?


view : App -> Html msg
view app =
  [ appContents app ]
    |> appSectionWrapper app
