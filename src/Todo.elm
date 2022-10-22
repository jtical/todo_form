module Todo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Browser


-- MODEL

type alias Model =
  { name : String
  , task : String
  , status : String
  , createList : Bool
  }

--INITAL MODEL
initialModel : Model
initialModel =
    { name = ""
    , task = ""
    , status = ""
    , createList = False
    }

--VIEW 
view : Model -> Html msg
view model =
    div []
        [ h1 [] [ text "TODO LIST" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text" ] []
                ]
            , div []
                [ text "Task"
                , input [ id "task", type_ "text" ] []
                ]
            , div []
                [ text "Status"
                , input [ id "status", type_ "text" ] []
                ]
            , div []
                [ button [ type_ "submit" ]
                    [ text "Create my list" ]
                ]
            ]
        ]

main : Html msg
main =
    view initialModel