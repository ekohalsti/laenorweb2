module TagGroups.Messages exposing (..)

import Http
import TagGroups.Models exposing (TagGroup)


-- messages relevant to todos
-- more thorough explanations can be
-- found in the Todos.Update module


type Msg
    = -- "no operation"
      NoOp
      -- http task success/fail messages
      -- (type variables with the response's return data)
    | Fail Http.Error
    | FetchAllDone (Result Http.Error (List TagGroup))
