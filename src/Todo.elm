module Todo exposing (main)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
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
view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "TODO LIST" ]
        , Html.form []
            [ div []
                [ text "Name"
                , input [ id "name", type_ "text", onInput SaveName ] []
                ]
            , div []
                [ text "Task"
                , input [ id "task", type_ "text", onInput SaveTask ] []
                ]
            , div []
                [ text "Status"
                , input [ id "status", type_ "text", onInput SaveStatus ] []
                ]
            , div []
                [ button [ type_ "submit", onClick Created ]
                    [ text "Create my list" ]
                ]
            ]
        ]


type Msg
    = SaveName String
    | SaveTask String
    | SaveStatus String
    | Created

--UPDATE

update : Msg -> Model -> Model
update message model =
    case message of
        SaveName name ->
            { model | name = name }

        SaveTask task ->
            { model | task = task }

        SaveStatus status ->
            { model | status = status }

        Created ->
            { model | createList = True }

main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }