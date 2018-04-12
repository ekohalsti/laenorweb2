module Main exposing (..)

import Html
import Messages exposing (..)
import Models exposing (init, Model, Flags)
import View exposing (view)
import Update exposing (update)
import Subscriptions exposing (subscriptions)


-- this is the entry point into our application
-- notice how there is no mention of "Todo" anywhere!
-- everything having to do with Todos is modularized and encapsulated

main : Program Flags Model Msg
main =
    Html.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
