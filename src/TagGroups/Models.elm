module TagGroups.Models exposing (..)

type alias Map = List String

type alias TagGroup =
    { id : Int
    , name : String
    , tags : List Tag
    }

type alias Tag =
    { id : Int
    , name : String
    , locationMap : Map
    }
