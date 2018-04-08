module TagGroups.Update exposing (..)

-- we want Msg along with all of its subtypes automatically (..)

import TagGroups.Messages exposing (Msg(..))
import TagGroups.Models exposing (TagGroup)


-- handle messages relevant to model.todos


update : Msg -> List TagGroup -> ( List TagGroup, Cmd Msg )
update msg todos =
    case msg of
        -- "no operation"
        NoOp ->
            ( todos, Cmd.none )

        -- this is matched when there is an http error
        -- it gives us an Http.Error, but we don't need it,
        -- so we'll just use an underscore _ to denote that

        Fail _ ->
            -- disregard error; do nothing
            ( todos, Cmd.none )

        -- fetch all success
        FetchAllDone res ->
            case res of
                Result.Ok newTagGroups ->
                    ( newTagGroups, Cmd.none )
                Result.Err _ ->
                    ( todos, Cmd.none )
