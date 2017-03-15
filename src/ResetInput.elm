port module ResetInput exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


port setValue : (String, String) -> Cmd msg


main =
  program
    { init = "" ! []
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }


type Msg = Reset


update msg model =
  case msg of
    Reset ->
      "" ! [ setValue ("input", "") ]


view model =
  div []
    [ input [ id "input", defaultValue "fooooo" ] []
    , button [ onClick Reset ] [ text "Reset" ]
    ]
