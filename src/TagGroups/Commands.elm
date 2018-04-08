module TagGroups.Commands exposing (..)

import Http
import Json.Encode
import Json.Decode
import Json.Decode.Pipeline exposing (decode, required, optional)
import String
import TagGroups.Models exposing (TagGroup, Tag)
import TagGroups.Messages exposing (Msg(..))


-- for a better introduction to commands, tasks, and Json.Decode, see here:
-- http://www.elm-tutorial.org/en/06-fetching-resources/04-players-cmds.html


resourceUrl : String
resourceUrl =
    "http://localhost:8000/tag_group/"



-- take a todo id and return its endpoint


singleUrl : Int -> String
singleUrl id =
    String.join "/" [ resourceUrl, (toString id) ]



--
-- Decoding
--
-- yes, the json->elm conversion is a pain since a json string can be *anything*
-- and elm is a strongly typed programming language.
-- check out the json-to-elm project for writing quick json decoders
-- https://github.com/eeue56/json-to-elm
-- json decoder for todos list


tagGroupsDecoder : Json.Decode.Decoder (List TagGroup)
tagGroupsDecoder =
    -- notice how decoders are composable
    Json.Decode.list tagGroupDecoder



-- json decoder for single todo


tagGroupDecoder : Json.Decode.Decoder TagGroup
tagGroupDecoder =
    decode TagGroup
        |> required "id" Json.Decode.int
        |> required "name" Json.Decode.string
        |> optional "tags" (Json.Decode.list tagDecoder) []

tagDecoder : Json.Decode.Decoder Tag
tagDecoder =
    decode Tag
        |> required "id" Json.Decode.int
        |> required "name" Json.Decode.string
        |> optional "map" (Json.Decode.list Json.Decode.string) []


--
-- Encoding
--


tagGroupEncoder : String -> Bool -> Json.Encode.Value
tagGroupEncoder title completed =
    let
        encodings =
            [ ( "title", Json.Encode.string title )
            , ( "completed", Json.Encode.bool completed )
            ]
    in
        encodings
            |> Json.Encode.object



--
-- Fetch
--
-- fetch all todos


fetchAll : Cmd Msg
fetchAll =
    let
        request = Http.get resourceUrl tagGroupsDecoder
    in
        Http.send FetchAllDone request
