module Model exposing (..)

import Material


type alias Model =
    { count : Int
    , mdl :
        Material.Model
    }


model : Model
model =
    { count = 0
    , mdl =
        Material.model
    }
