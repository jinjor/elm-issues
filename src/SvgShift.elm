module SvgShift exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.App exposing (..)
import Svg exposing (Svg)
import Color exposing (..)
import FontAwesome exposing (..)
import Keyboard exposing (..)


main =
  program
    { init = 50 ! []
    , view = view
    , update = update
    , subscriptions = \_ -> downs identity
    }


update keyCode model =
  (model +
    if keyCode == 38 then
      1
    else if keyCode == 40 then
      -1
    else
      0
  ) ! []


view size =
  div []
  [ text "press ↑ ↓ to resize"
  , hr [] []
  , div
    [ style (containerStyles size) ]
    [ icon size ]
  ]


icon size =
  check black size


containerStyles size =
  [ ("width", px size)
  , ("height", px size)
  , ("background", "#ccc")
  ]


px n =
  toString n ++ "px"
