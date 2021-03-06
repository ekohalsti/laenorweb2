module Models exposing (..)

-- notice how we can import the sub-types of a union type
-- if we wanted to just import them all, we could use (..)
-- but i think it's usually better to be explicit about imports
-- unless you truly need everything (like in Todos.Update)

import Messages exposing (Msg(TagGroupsMsg))
import TagGroups.Models exposing (TagGroup)
import TagGroups.Commands


-- this is our "root" model
-- all app state is stored in this record


type alias Model =
    { tagGroups : List TagGroup
    }


type alias Flags =
    { apiUrl : String
    }



-- see Todos.Models.TodoEditView
-- this is the initial state for the application
-- this is supplied to Html.App.Program in Main


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        -- type aliases can be used as functions, with the arguments
        -- being in the same order they were declared in (above).
        -- here we're creating the initial model with an empty list of Todos
        -- and the "None" state for the todoEditView
        model =
            Model []

        -- ...instead we could have done:
        -- model = { todos = [], todoEditView = None }
        -- on initial load, we can use Cmd.batch to return a list
        -- of commands as a single command.
        -- here it's not really necessary since we only have one command
        cmds =
            Cmd.batch
                -- create a single command to fetch todos from api,
                -- mapping it with the "root" Messages.Msg.TodosMsg
                [ Cmd.map TagGroupsMsg (TagGroups.Commands.fetchAll flags.apiUrl) ]
    in
        ( model, cmds )
