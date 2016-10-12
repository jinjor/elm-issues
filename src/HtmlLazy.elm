import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.Lazy exposing (..)


main =
  program
    { init = init ! []
    , view = view
    , update = update
    , subscriptions = \_ -> Sub.none
    }


init =
  { target1 = a
  , target2 = a
  , target3 = a
  , target4 = a
  , target5 = a
  , target6 = a
  , target7 = a
  , target8 = a
  , target9 = a
  }


a = { foo = 1 }


b = { foo = 1 }


override a = { a | foo = 1 }


view model =
  div []
  [ lazy view1 model.target1
  , lazy view2 model.target2
  , lazy view3 model.target3
  , lazy view4 model.target4
  , lazy view5 model.target5
  , lazy view6 (1, model.target6)
  , lazy view7 { target = model.target7 }
  , lazy (\target -> view8 target) model.target8
  , let f target = view9 target in lazy f model.target9
  , button [ onClick () ] [ text "update (see console)" ]
  ]


view1 target =
  let _ = Debug.log "called" "1(no change)" in div [] [ text (toString target) ]


view2 target =
  let _ = Debug.log "called" "2(same reference)" in div [] [ text (toString target) ]


view3 target =
  let _ = Debug.log "called" "3(identity-ed value)" in div [] [ text (toString target) ]


view4 target =
  let _ = Debug.log "called" "4(different reference)" in div [] [ text (toString target) ]


view5 target =
  let _ = Debug.log "called" "5(overridden value)" in div [] [ text (toString target) ]


view6 (_, target) =
  let _ = Debug.log "called" "6(no change - pass within tuple)" in div [] [ text (toString target) ]


view7 { target } =
  let _ = Debug.log "called" "7(no change - pass within record)" in div [] [ text (toString target) ]


view8 target =
  let _ = Debug.log "called" "8(no change - lambda function)" in div [] [ text (toString target) ]


view9 target =
  let _ = Debug.log "called" "9(no change - local function)" in div [] [ text (toString target) ]


update msg model =
  case msg of
    () ->
      { model |
        target1 = model.target1
      , target2 = a
      , target3 = identity model.target3
      , target4 = b
      , target5 = override model.target5
      , target6 = model.target6
      , target7 = model.target7
      , target8 = model.target8
      , target9 = model.target9
      } ! []
