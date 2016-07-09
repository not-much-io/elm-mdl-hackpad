module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Material.Scheme
import Material.Button as Button
import Update exposing (Msg)
import Model exposing (Model)


view : Model -> Html Msg
view model =
    div [ style [ ( "padding", "2rem" ) ] ]
        [ text ("Current count: " ++ toString model.count)
          {- We construct the instances of the Button component that we need, one
             for the increase button, one for the reset button. First, the increase
             button. The arguments are:
             - An instance id (the `[0]`). Every component that uses the same model
             collection (model.mdl in this file) must have a distinct instance id.  -
             - A Msg constructor (`Mdl`), lifting MDL actions to your Msg type.
             - An initial model (`(Button.model True)`---a button with a ripple animation.
             Notice that we do not have to add increase and reset separately to model.mdl,
             and we did not have to add to our update actions to handle their internal events.
          -}
        , br [] []
        , Button.render Update.MDL
            [ 0 ]
            model.mdl
            [ Button.onClick Update.Increase ]
            [ text "Increase" ]
        , Button.render Update.MDL
            [ 1 ]
            model.mdl
            [ Button.onClick Update.Decrease ]
            [ text "Decrease" ]
        , Button.render Update.MDL
            [ 2 ]
            model.mdl
            [ Button.onClick Update.Reset ]
            [ text "Reset" ]
        ]
        |> Material.Scheme.top
