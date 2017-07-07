module Download exposing (..)

import Html exposing (text, a, div)
import Html.Attributes exposing (href, download, attribute, property)
import Json.Encode


main =
    div []
        [ a
            [ href "image.png"
            , download True
            ]
            [ text "download True" ]
        , a
            [ href "image.png"
            , download False
            ]
            [ text "download False" ]
        , a
            [ href "image.png"
            , attribute "download" ""
            ]
            [ text """attribute "download" "" """ ]
        , a
            [ href "image.png"
            , attribute "download" "foo.png"
            ]
            [ text """attribute "download" "foo.png" """ ]
        , a
            [ href "image.png"
            , property "download" (Json.Encode.string "")
            ]
            [ text """property "download" (Json.Encode.string "")""" ]
        , a
            [ href "image.png"
            , property "download" (Json.Encode.string "foo.png")
            ]
            [ text """property "download" (Json.Encode.string "foo.png")""" ]
        ]
