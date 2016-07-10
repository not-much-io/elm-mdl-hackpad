module View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (href, class, style)
import Material.Scheme
import Material.Button as Button
import Material.Table as Table
import Material.Toggles as Toggles
import Update exposing (Msg)
import Model exposing (Model)


type alias Data =
    { material : String
    , quantity : String
    , unitPrice : String
    }


sortedData : List Data
sortedData =
    List.repeat 10
        (Data "Material" "10" "100")


table : List Data -> Html Msg
table list =
    Table.table []
        [ Table.thead []
            [ Table.tr []
                [ Table.th []
                    [ text "Proficiency" ]
                , Table.th [ Table.numeric ]
                    [ text "Score" ]
                , Table.th []
                    [ text "Skill" ]
                ]
            ]
        , Table.tbody []
            (list
                |> List.map
                    (\item ->
                        Table.tr []
                            [ Table.td [] [ text item.material ]
                            , Table.td [ Table.numeric ] [ text item.quantity ]
                            , Table.td [ Table.numeric ] [ text item.unitPrice ]
                            ]
                    )
            )
        ]


type Skill
    = Acrobatics
    | AnimalHandling
    | Arcana
    | Athletics
    | Deception
    | History
    | Insight
    | Intimidation
    | Investigation
    | Medicine
    | Nature
    | Perception
    | Performance
    | Persuasion
    | Religion
    | SleightOfHand
    | Stealth
    | Survival


type alias SkillScore =
    { proficiency : Bool
    , score : Int
    , skill : Skill
    }


skillScores : List SkillScore
skillScores =
    List.repeat 10 (SkillScore False 0 Acrobatics)


skills : Model -> List SkillScore -> Html Msg
skills model skillScores =
    div []
        (List.map
            (\ ( id, skill ) ->
                Toggles.checkbox Update.MDL
                    [ id ]
                    model.mdl
                    [ Toggles.value skill.proficiency ]
                    [ text "0 Acrobatics" ]
            )
            (List.map2 (,)
                [1..10]
                skillScores
            )
        )


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
        , table sortedData
        , skills model skillScores
        ]
        |> Material.Scheme.top
