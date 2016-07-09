module Update exposing (..)

import Model exposing (Model)
import Material


type Msg
    = Increase
    | Decrease
    | Reset
    | MDL Material.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Increase ->
            ( { model | count = model.count + 1 }
            , Cmd.none
            )

        Decrease ->
            ( { model | count = model.count - 1 }
            , Cmd.none
            )

        Reset ->
            ( { model | count = 0 }
            , Cmd.none
            )

        {- Boilerplate: MDL action handler. It should always look like this. -}
        MDL action' ->
            Material.update MDL action' model
