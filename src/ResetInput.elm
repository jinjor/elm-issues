port module ResetInput exposing (..)

import Json.Decode as Decode exposing (Decoder)
import Html exposing (..)
import Html.Attributes as Attributes exposing (..)
import Html.Events exposing (..)


port setValue : (String, String) -> Cmd msg


main =
  program
    { init = "" ! []
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }


type Msg = SetValue String String


update msg model =
  case msg of
    SetValue id value ->
      value ! [ setValue (id, value) ]


elementId = "input"


view model =
  div []
    [ input [ id elementId, defaultValue "initial", onEnter (SetValue elementId "done") ] []
    , button [ onClick (SetValue elementId "")] [ text "Reset" ]
    , button [ onClick (SetValue elementId "Hey!") ] [ text "1" ]
    , button [ onClick (SetValue elementId "Yo!") ] [ text "2" ]
    ]


onEnter msg =
  on "keydown" (keyCode |> Decode.andThen (\i ->
    if i == 13 then Decode.succeed () else Decode.fail ""
  ))
  |> Attributes.map (always msg)
