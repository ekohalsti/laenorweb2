module TagGroups.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, attribute)
import TagGroups.Models exposing (TagGroup, Tag, Map)
import TagGroups.Messages exposing (Msg(NoOp))

view : List TagGroup -> Html Msg
view tagGroups =
    div [ attribute "class" "pure-g" ]
        <| List.map tagGroup <| tagGroups

tagGroup : TagGroup -> Html Msg
tagGroup t =
    let
        { name, tags } = t
    in
        div [ attribute "class" "pure-u-1" ]
            ((tagGroupName name) :: List.map tag tags)

tagGroupName : String -> Html Msg
tagGroupName name =
    div [ attribute "class" "pure-u-1" ]
            [ div [ attribute "class" "box" ]
                  [ h3 [] [ text name ]
                  ]
            ]

tag : Tag -> Html Msg
tag t =
    let
        { id, name, locationMap } = t
    in
        div [ attribute "class" "pure-u-1 pure-u-md-1-3 pure-u-lg-1-5" ]
            [ div [ attribute "class" "box area" ]
                  [ mapToHtml locationMap
                  , div [ attribute "class" "name" ]
                        [ text name
                        , text (toString id)
                        ]
                  ]
            ]

mapToHtml : Map -> Html Msg
mapToHtml locationMap =
    if List.isEmpty locationMap then
        text ""
    else
        div [ attribute "class" "maploc" ]
            (List.map (pre [])
                 (List.map (String.foldr colorTerrain []) locationMap))

colorTerrain : Char -> List(Html Msg) -> List(Html Msg)
colorTerrain c html =
    let
        color =
            case c of
                ',' -> "yellow"
                'y' -> "yellow"
                'z' -> "yellow"
                'b' -> "yellow"
                'd' -> "yellow"
                '!' -> "white"
                '?' -> "white"
                '%' -> "white"
                't' -> "white"
                '#' -> "light black"
                '+' -> "light black"
                '-' -> "light black"
                '=' -> "light black"
                'C' -> "light black"
                'c' -> "light black"
                '.' -> "green"
                'F' -> "green"
                'v' -> "green"
                'f' -> "green"
                'j' -> "green"
                '@' -> "red"
                'L' -> "red"
                'V' -> "red"
                'x' -> "red"
                's' -> "red"
                'H' -> "magenta"
                '^' -> "magenta"
                'h' -> "magenta"
                'R' -> "blue"
                'r' -> "blue"
                'i' -> "blue"
                'l' -> "blue"
                '~' -> "blue"
                'S' -> "cyan"
                'w' -> "cyan"
                _   -> ""

    in
         span [ attribute "class" color ] [ text (String.fromChar c) ] :: html
