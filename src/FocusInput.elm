import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Dom
import Task


main =
  program
    { init = "" ! []
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }


view model =
  div []
    [ input [ id "input", defaultValue "fooooo" ] []
    , button [ onClick "click" ] [ text "focus" ]
    ]


update msg model =
  case msg of
    "click" ->
      model ! [ Task.attempt (\_ -> "") (Dom.focus "input") ]

    _ ->
      model ! []
