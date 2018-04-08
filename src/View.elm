module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, href, target, attribute)
import Html exposing(map)
import Models exposing (Model)
import Messages exposing (Msg(TagGroupsMsg))
import TagGroups.List


-- this is our "root" view. the entire appearance of our application
-- is derived here from the app state (model)


view : Model -> Html Msg
view model =
    div []
        [ siteHeader
        , Html.map TagGroupsMsg <| TagGroups.List.view model.tagGroups
        ]


siteHeader : Html Msg
siteHeader =
    div [ attribute "class" "header" ]
        [ h1 [] [ text "^o^ laenorweb2" ]
        , h2 [] [ text "subtitle" ]
        ]


atb : String -> String -> Html Msg
atb url title =
    a
        [ href url
        , target "_blank"
        ]
        [ text title ]
