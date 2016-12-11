elm-make src/HtmlLazy.elm --output=docs/html-lazy.html
elm-make src/FocusInput.elm --output=docs/focus-input.html
elm-make src/SvgShift.elm --output=docs/svg-shift.html

# compile error
elm-make src/PatternMatchErr.elm --output=/dev/null
