module Main exposing (..)

import Html.App as App
import Platform.Cmd exposing (Cmd)
import Model exposing (model)
import View exposing (view)
import Update exposing (update)


main : Program Never
main =
    App.program
        { init = ( model, Cmd.none )
        , view = view
        , subscriptions = always Sub.none
        , update = update
        }
